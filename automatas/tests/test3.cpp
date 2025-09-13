#include <iostream>
#include <vector>
using namespace std;

template <typename T>
T mayor(T a, T b) {
    return (a > b) ? a : b;
}

int main() {
    vector<int> nums = {10, 20, 5};
    cout << mayor(nums[0], nums[1]) << endl;
    return 0;
}
