#include <bits/stdc++.h>

using namespace std;

typedef long long ll;
typedef vector<ll> vi;
typedef vector<vector<ll>> vvi;

vi mem(100);
/*
ideja je bazirana na crveno/crnim stablima. Ako je jednom nodeu pridruzena '1' onda je svim njegovim susjedima pridruzena '2'
i obrnuto, te zbog toga koristim bfs jer zelim ici nivo po nivo i "bojati" susjede. U trenutku kad nađem da imam
dva susjedna vrha "obojana" istom bojom znam da mi graf ne valja te prekidam funkciju (odnosno vraćam "true"). Ako graf
valja funkcija ce doci do kraja te ce vratiti "false".
 */
bool bfs(vvi L,ll i){
    queue<ll> Q;
    Q.push(i);
    mem[i] = 1;
    while(!Q.empty()){
        ll tempi = Q.front();
        Q.pop();
        for(ll j = 0;j < L[tempi].size();j++){
			//da nije bilo uvijeta "mem[L[tempi][j]] == 0" onda bi bio endless loop za ciklički graf
            if(mem[tempi] != mem[L[tempi][j]] && mem[L[tempi][j]] == 0){
                if(mem[tempi] == 1) mem[L[tempi][j]] = 2;
                else mem[L[tempi][j]] = 1;
                Q.push(L[tempi][j]);
            }
            else if(mem[tempi] == mem[L[tempi][j]]){
                return true;
            }
        }
    }
    return false;
}


int main() {
    ll n, m; cin >> n >> m;
    vvi L(n);
    for(ll i = 0;i < m;i++){
        ll u, v; cin >> u >> v;
        L[u-1].push_back(v-1);
        L[v-1].push_back(u-1);
    }

    bool flag = false;
    for(ll i = 0;i < n;i++){
        //Provjeri graf samo ako ga nisam provjerio dosad
        if(mem[i] == 0){ flag = bfs(L,i); }
        //ako sam naso jedan graf koji ne valja ne moram dalje provjeravat
        if(flag) break;
    }

    if(flag) cout << "NO" << endl;
    else cout << "YES" << endl;

    return 0;
}