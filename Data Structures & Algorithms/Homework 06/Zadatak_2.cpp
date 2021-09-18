#include <iostream>
#include <vector>
#include <algorithm>
#include <utility>

using namespace std;

typedef long long ll;
typedef unsigned long long ull;
typedef vector<ll> vi;
typedef vector<vector<pair<ll,ll>>> vvpi;

void SingleSource(vi &polje,ll s){
    for(ll i = 0;i < polje.size();i++) polje[i] = INT_MAX;
    polje[s] = 0;
}

void Relax(vvpi &L,vi &polje,vi &obisao,ll s){
    obisao[s] = 1;
    for(ll i = 0;i < L[s].size();i++){
        if(polje[L[s][i].first] > polje[s] + L[s][i].second) polje[L[s][i].first] = polje[s] + L[s][i].second;
        if(obisao[L[s][i].first] == -1) Relax(L,polje,obisao,L[s][i].first);
    }
}


bool bellmanford(vvpi &L,ll s,ll n){
    vi polje(n);
    SingleSource(polje,s);

    vi obisao(n);
    for(ll i = 0;i < n;i++) obisao[i] = -1;
    Relax(L,polje,obisao,s);

    for(ll i = 0;i < n;i++){
        for(ll j = 0;j < L[i].size();j++){
            if(polje[L[i][j].first] > polje[i] + L[i][j].second) return false;
        }
    }
    return true;
}



int main() {
    ll c; cin >> c;
    vector<bool> flagovi;
    for(ll i = 0;i < c;i++){
        ll n, m; cin >> n >> m;
        vvpi L(n);
        for(ll j = 0;j < m;j++){
            ll x, y, t; cin >> x >> y >> t;
            L[x].push_back(make_pair(y,t));
        }


        flagovi.push_back(bellmanford(L,0,n));

    }

    for(ll i = 0;i < flagovi.size();i++){
        if(flagovi[i] == 0) cout << "possible" << endl;
        else cout << "not possible" << endl;
    }

    return 0;
}