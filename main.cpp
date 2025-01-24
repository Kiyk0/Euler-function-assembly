//y' = - 283x^3 + 22x^2 + 12x +279y^3 - 20y^2 - 30y - 7
#include<iostream>

using namespace std;

float derivative(float x, float y) {
    float r= -283*x*x*x + 22*x*x + 12*x + 279*y*y*y - 20*y*y - 30*y - 7;     //y'
    return r;
}


int main() {
    int xn=0,yn,n,h,x,y,slope,i;                                   //s0 s1 s2 s3 s4 s5 s6 s7
    cout<<"\nEnter the initial value of y:\n"; cin>>yn;            //Initial values
    cout<<"\nEnter the interval width,h:\n"; cin>>h;               //Input width
    cout<<"\nEnter the required number of steps,n:\n"; cin>>n;     //Number of steps
    cout<<"\nxn\tyn\tslope\ty\n";
    cout<<"------------------------------\n";
    for(i=0; i < n; i++) {
        slope = derivative(xn, yn);
        y = yn + h*slope;
        cout<<xn<<"\t"<< yn<<"\t"<<slope<<"\t"<<y<<endl;
        yn = y;
        xn = xn+h;
    }
    cout<<"\nValue of y at x = "<<x<<" is "<<y<<endl;
    return 0;
}