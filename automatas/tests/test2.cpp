#include <iostream>
#define PI 3.14159
#define CUADRADO(x) ((x)*(x))
using namespace std;

int main() {
    double area = PI * CUADRADO(5);
    cout << "Area: " << area << endl;
    return 0;
}
