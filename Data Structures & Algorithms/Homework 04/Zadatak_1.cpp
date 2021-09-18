#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

typedef long long ll;
typedef vector<ll> vi;
typedef vector<vector<ll>> vvi;
vi polje(100005);
ll glob_max = 0;


ll dfs(vvi L,ll n){
    if(polje[n] != 0) return polje[n];
    ll loc_max = 0;
    for(ll i = 0;i < L[n].size();i++){
        loc_max = max(loc_max,dfs(L,L[n][i]) + 1);
    }

    glob_max = max(loc_max,glob_max);
    polje[n] = loc_max;
    return loc_max;
}

int main() {
    ll n, m; cin >> n >> m;
    vvi L(n);

    for(ll i = 0;i < m;i++){
        ll t, v; cin >> t >> v;
        L[t-1].push_back(v-1);
    }

    for(ll i = 0;i < n;i++) dfs(L,i);

    cout << glob_max << endl;
    return 0;
}