#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>

using namespace std;

typedef long long ll;
typedef vector<ll> vi;
typedef vector<vector<ll>> vvi;


void SingleSource (vi &polje,vi &pi,ll s){
    for(ll i = 0;i < polje.size();i++) {
        polje[i] = INT_MIN;
        pi[i] = 0;
    }
    polje[s] = 0;
}

void Relax(ll u,ll v,vi &polje,vvi &L,vi &pi, priority_queue<pair<ll,ll>> &Q){
    if((polje[v] > polje[u] + L[u][v] || polje[v] == INT_MIN) && pi[v] != u){
        polje[v] =  polje[u] + L[u][v];
        pi[v] = u;
        Q.push(make_pair(polje[v],v));
    }
}

bool Dijkstra(vvi &L,vi &polje,vi &prosao,ll s,ll d){
    vi pi(L.size());
    SingleSource(polje,pi,s);



    priority_queue<pair<ll,ll>> Q;
    Q.push(make_pair(polje[s],s));

    bool nijeobiden = true;
    ll prethodnik;
    while(!Q.empty()){
        ll u = Q.top().second;
        Q.pop();
        for(ll i = 0;i < L[u].size();i++ ){
            //Ako je tim putem Mirko vec prosao ne prolazi
            if(L[u][i] != -1 && (prosao[u] != 1 || prosao[i] != 1)) Relax(u,i,polje,L,pi, Q);
            //Ako je Ivan došao do kolodvora drugacijim putem od Mirka
            if(u == d && (prosao[prethodnik] != 1 || prosao[d] != 1)) nijeobiden = false;
        }
        prethodnik = u;
        if(Q.empty() && nijeobiden ) return false;

    }


    for(ll i = d;i != pi[s];i = pi[i]){
        prosao[i] = 1;
    }
    return true;
}



int main() {
    ll n;
    vi rijesenja;
    vector<bool> flagovi;
    while(cin >> n, n != 0){
        ll m; cin >> m;

        vvi L(n+1, vector<ll> (n+1));
        vi prosao(n+1);
        prosao[1] = 1;


        for(ll j = 0;j < n+1;j++){
            for(ll ii = 0;ii < n+1;ii++) L[j][ii] = -1;
            prosao[j] = 0;
        }


        for(ll i = 0;i < m;i++){
            ll a, b, t; cin >> a >> b >> t;
            L[a][b] = t;
            L[b][a] = t;
        }

        ll rijesenje = 0;
        bool flag = true;
        for(ll j = 0;j < 2;j++) {
            vi polje(L.size());
            bool temp = Dijkstra(L, polje, prosao, 1,n);
            flag = flag && temp;
            rijesenje += polje[n];
        }
        flagovi.push_back(flag);
        rijesenja.push_back(rijesenje);
    }

   for(ll i = 0;i < flagovi.size();i++){
       if(flagovi[i]) cout << rijesenja[i] << endl;
        else cout << "Caught" << endl;
    }




    return 0;
}