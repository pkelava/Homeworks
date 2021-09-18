#include <iostream>
#include <queue>
#include <cmath>
using namespace std;

//polje u kojem pamitmo sve brojeve koje smo prosli
int polje[100000];

void bfs(int n, int m){
    //prvi element prati na kojem smo broju, dok drugi broj koliko nam je koraka trebalo do tog broja
    queue<pair<int,int>> Q;
    //broj od kojeg krecemo, a za njega nam je trebalo 0 koraka
    pair<int,int> a(n,0);
    Q.push(a);
    while(!Q.empty()){
        pair<int,int> temp = Q.front();
        Q.pop();

        if(temp.first == m){
            return;
        }
        else if(temp.first >= 0){
            pair<int,int> a(temp.first * 2,temp.second + 1);
            pair<int,int> b(temp.first - 1,temp.second + 1);
            //pitamo se jesmo li vec bili u tom broju, i jeli nam trenutni put brzi
            if(polje[a.first] >= a.second){
                Q.push(a);
                polje[a.first] = a.second;
            }
            if(b.first >= 0 && polje[b.first] >= b.second) {
                Q.push(b);
                polje[b.first] = b.second;
            }


        }
    }
}


int main() {
    int n, m; cin >> n >> m;
    for(int i = 0;i < 2* max(m,n) + 5;i++) polje[i] = INT_MAX;
    bfs(n,m);
    cout << polje[m] << endl;
    return 0;
}