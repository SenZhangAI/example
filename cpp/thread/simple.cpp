#include <iostream>
#include <string>
#include <thread>

int main()
{
    std::string a("Hello");
    std::cout << "address = " << &a << "\n";
    std::thread t([](std::string &a) {
        std::cout << "in thread address = " << &a << "\n";
    },
                  std::ref(a));
    t.join();
}
