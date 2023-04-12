#include <thread>
#include <mutex>
#include <queue>
#include <vector>
#include <condition_variable>

//using namespace std::literals::chrono_literals;
using callback = void(*)(void*);

class Task{
public:
    callback function_;
    void* arg_;
public:
    Task(callback function, void* arg):function_(function),arg_(arg){}
};


class ThreadPool{
public:
    ThreadPool(int min,int max);
    void Add(callback f,void* arg);
    void Add(Task task);
    int BusyNum();
    int AliveNum();
    ~ThreadPool();
private:
    std::queue<Task>taskQ_;
    std::thread* managerID_;
    std::vector<std::thread*> threadIDs_;
    int minNum_;
    int maxNum_;
    int busyNum_;
    int liveNum_;
    int exitNum_;

    std::mutex mutexPool_;
    std::condition_variable cond_;
    bool shutdown_;
    static void manager(void* arg);
    static void worker(void* arg);
};