#include <iostream>
using namespace std;

int main() {
    int bin = 0b1011;   // binario
    int hex = 0x1A;     // hexadecimal
    long long big = 1234567890123LL;
    float f = 1.23f;
    char32_t smile = U'😊';

    cout << "bin: " << bin << endl;
    cout << "hex: " << hex << endl;
    cout << "big: " << big << endl;
    cout << "f: " << f << endl;
    // El emoji puede no imprimirse bien en todas las consolas
    return 0;
}
