#include "iostream"
#include "thread_pool.hpp"
#include <vector>

using namespace std;
int ThreadProcess(string &req)
{
    cout << "hello" << req << endl;
    req[1] = '1';
    return 1;
}

int main()
{
    vector<string> lst;
    lst.emplace_back("123");
    lst.emplace_back("abc");
    lst.emplace_back("xyz");
    lst.emplace_back("opq");

    ThreadPool pool(4);
    for (int i = 0; i < 4; i++) {
        int k = i % 4;
        // without std;:ref will not modify args
        //pool.enqueue(ThreadProcess, lst[i]);
        pool.enqueue(ThreadProcess, std::ref(lst[i]));
    }
}
