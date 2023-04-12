#include "ThreadPool.h"
#include <stdlib.h>
#include <iostream>
#include <string.h>
#include <mutex>
#include <condition_variable>
#define NUMBER 2

ThreadPool::ThreadPool(int min,int max):minNum_(min),maxNum_(max),busyNum_(0),liveNum_(min),exitNum_(0),shutdown_(false){
    //this:传递给线程入口函数的参数，即线程池
    managerID_ = new std::thread(manager, this);
    threadIDs_.resize(max);
    for(int i = 0; i < min; ++i){
        threadIDs_[i] = new std::thread(worker, this);
    }
}

ThreadPool::~ThreadPool(){
    shutdown_ = true;
    //阻塞收回管理者线程
    if(managerID_->joinable()) managerID_->join();
    //唤醒阻塞的消费者线程
    cond_.notify_all();
    for(int i = 0; i < maxNum_; ++i){
        if(threadIDs_[i]->joinable()) threadIDs_[i]->join();
    }
}

void ThreadPool::Add(Task t){
    std::unique_lock<std::mutex> lk(mutexPool_);
    if(shutdown_) return;
    taskQ_.push(t);
    cond_.notify_all();
}

void ThreadPool::Add(callback f, void* a){
    std::unique_lock<std::mutex> lk(mutexPool_);
    if(shutdown_) return;
    taskQ_.push(Task(f, a));
    cond_.notify_all();
}

int ThreadPool::BusyNum(){
    mutexPool_.lock();
    int busy_num = busyNum_;
    mutexPool_.unlock();
    return busy_num;
}

int ThreadPool::AliveNum(){
    mutexPool_.lock();
    int alive_num = liveNum_;
    mutexPool_.unlock();
    return alive_num;
}

void ThreadPool::worker(void* arg){
    ThreadPool* pool = static_cast<ThreadPool*>(arg);


    while(true){
        std::unique_lock<std::mutex>lk(pool->mutexPool_);
        
        while(pool->taskQ_.empty() && !pool->shutdown_){
            pool->cond_.wait(lk);
            if(pool->exitNum_ > 0){
                pool->exitNum_ --;
                if(pool->liveNum_ > pool->minNum_){
                    pool->liveNum_--;
                    std::cout << "threadid: " << std::this_thread::get_id() << " exit......" << std::endl;
                    lk.unlock();
                    return;
                }
            }
        }

        Task task = pool->taskQ_.front();
        pool->taskQ_.pop();
        pool->busyNum_++;
        lk.unlock();
        std::cout << "thread::" << std::this_thread::get_id() << " start wording..." << std::endl;
        task.function_(task.arg_);
        free(task.arg_);
        task.arg_ = nullptr;
        std::cout << "thread:" << std::this_thread::get_id() << " end working..." << std::endl;
        lk.lock();
        pool->busyNum_--;
        lk.unlock();
    }
}

void ThreadPool::manager(void* arg){
    ThreadPool* pool = static_cast<ThreadPool*>(arg);
    std::unique_lock<std::mutex>lk(pool->mutexPool_);
    int queue_size = pool->taskQ_.size();
    int busy_num = pool->busyNum_;
    int alive_num = pool->liveNum_;
    lk.unlock();
    
    if(alive_num < queue_size && pool->liveNum_ < pool->maxNum_){
        lk.lock();
        int count = 0;
        for(int i = 0; i < pool->liveNum_ && count < NUMBER && pool->liveNum_ < pool->maxNum_; ++i){
            if(pool->threadIDs_[i] == nullptr){
                std::cout << "Create a new thread..." << std::endl;
                pool->threadIDs_[i] = new std::thread(worker,pool);
                pool->liveNum_++;
                count++; 
            }
        }
        lk.unlock();
    }

    if(busy_num * 2 < pool->liveNum_ && pool->liveNum_ < pool->minNum_){
        lk.lock();
        pool->exitNum_ = NUMBER;
        lk.unlock();
        for(int i = 0; i < NUMBER; ++i){
            pool->cond_.notify_all();
        }
    }
}