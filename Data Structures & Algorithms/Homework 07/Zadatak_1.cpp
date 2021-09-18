#include <iostream>
#include <vector>
#include <algorithm>
#include <Queue>
#include <utility>

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
    if((polje[v] > polje[u] + L[u][v] + 12 || polje[v] == INT_MIN) && pi[v] != u){
        polje[v] =  polje[u] + L[u][v] + 12;
        pi[v] = u;
        Q.push(make_pair(polje[v],v));
    }
}

void Dijkstra(vvi &L,vi &polje,ll s){


    vi pi(L.size());
    SingleSource(polje,pi,s);



    priority_queue<pair<ll,ll>> Q;
    Q.push(make_pair(polje[s],s));


    while(!Q.empty()){
        ll u = Q.top().second;
        Q.pop();
        for(ll i = 0;i < L[u].size();i++ ){
            if(L[u][i] != -1) Relax(u,i,polje,L,pi, Q);
        }
    }
}

int main() {
    ll k; cin >> k;
    vi rijesenja;
    for(ll i = 0;i < k;i++){

        ll n, r, s, d; cin >> n >> r >> s >> d;
        vvi gradovi(n+1,vector<ll> (n+1));
        vi polje(gradovi.size());
        for(ll j = 0;j < n+1;j++){
            for(ll ii = 0;ii < n+1;ii++) gradovi[j][ii] = -1;
        }

        for(ll j = 0;j < r;j++){
            ll u,v,t; cin >> u >> v >> t;
            gradovi[u][v] = t;
            gradovi[v][u] = t;
        }
        Dijkstra(gradovi,polje,s);

        rijesenja.push_back(polje[d]);
    }

    for(ll i = 0;i < rijesenja.size();i++) cout << rijesenja[i] << endl;

    return 0;
}