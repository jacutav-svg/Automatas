#include <iostream>
using namespace std;

class Punto {
    int x, y;
public:
    Punto(int a, int b) : x(a), y(b) {}
    Punto operator+(const Punto& other) {
        return Punto(x + other.x, y + other.y);
    }
    void imprimir() {
        cout << "(" << x << "," << y << ")";
    }
};

int main() {
    Punto p1(1,2), p2(3,4);
    Punto p3 = p1 + p2;
    p3.imprimir();
    return 0;
}
