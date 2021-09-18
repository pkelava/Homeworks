#include <iostream>
#include <cmath>
using namespace std;

int main()
{
    int n, m; cin >> n >> m;
    int D[n], C[m];
    for(int i = 0;i < n;i++) D[i] = 0;
    for(int i = 0;i < m;i++) C[i] = 0;
    int sret; cin >> sret;
    for(int i = 0;i < sret;i++){
        int t; cin >> t;
        D[t] = 1;
    }
    cin >> sret;
    for(int i = 0;i < sret;i++){
        int t; cin >> t;
        C[t] = 1;
    }

    for(int i = 0;i < 2*m*n;i++){
        if(D[i % n] == 1) C[i % m] = 1;
        else if(C[i % m] == 1) D[i % n] = 1;
    }
    bool flag = true;
    for(int i = 0;i < n;i++){
        if(D[i] != 1) { flag = false;  }
    }
    for(int i = 0;i < m;i++){
        if(C[i] != 1) {flag = false; }
    }

    if(flag) cout << "YES";
    else cout << "NO";

    return 0;
}