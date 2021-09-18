#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

typedef long long ll;
typedef vector<ll> vi;
typedef vector<vector<ll>> vvi;
vi otkriven(100005);
vi otkriven2(100005);
vi provjerio(100005);

ll t = 1;

void dfs(vvi L, ll n){
    if(otkriven[n] != 0) return;
    otkriven[n] = t;
    otkriven2[n] = t++;
    for(ll i = 0;i < L[n].size();i++){
        dfs(L,L[n][i]);
    }
}

ll dfs2(vvi L,ll n,ll dosao){
    if(provjerio[n] != 0) return otkriven2[n];
    provjerio[n] = 1;
    for(ll i = 0;i < L[n].size();i++){
        if(L[n][i] != dosao) otkriven2[n] = min(otkriven2[n],dfs2(L,L[n][i],n));
    }
    return otkriven2[n];
}

int main() {
    ll n, m; cin >> n >> m;
    vvi L(n);
    ll root = -1;
    for(ll i = 0;i < m;i++){
        ll t, v; cin >> t >> v;
        if(root == -1) root = t - 1;
        L[t-1].push_back(v-1);
        L[v-1].push_back(t-1);
    }

    dfs(L,root);
    dfs2(L, root, -1);

    vi artikulacijske(n);

    for(ll i = 0;i < n;i++) artikulacijske[i] = 0;
    for(ll i = 0;i < n;i++) {
        for (ll j = 0; j < L[i].size() && L[i].size() > 1; j++) {
            if (otkriven2[L[i][j]] >= otkriven[i] && otkriven2[L[i][j]] != otkriven[root]) {
                artikulacijske[i] = 1;
            }
        }
    }
    for(ll i = 0;i < n;i++){
        if(artikulacijske[i] == 1) cout << i+1 << " ";
    }

    return 0;
}