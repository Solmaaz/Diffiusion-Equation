#include "./include/header.h"

int main()
{
    int x, y, t0 = 50, i, j, M = 3;
    const int L = 50;
    const int N = L * L;
    double** g=new double*[L];
    for(int i=0;i<L;i++){
        g[i]=new double[L];
    }
    double** D=new double*[L];
    for(int i=0;i<L;i++){
        D[i]=new double[L];
    }
    double** S=new double*[L];
    for(int i=0;i<L;i++){
        S[i]=new double[L];
    }
    double** fi=new double*[L];
    for(int i=0;i<L;i++){
        fi[i]=new double[L];
    }
    //double Y[L][L];
    double** fi_t=new double*[L];
    for(int i=0;i<L;i++){
        fi_t[i]=new double[L];
    }
    double** T=new double*[L*L];
    for(int i=0;i<L*L;i++){
        T[i]=new double[L*L];
    }

initialization(fi,D,g);
coefficentv2(T,S);
solving_fi(fi,fi_t,T);
    return 0;
}