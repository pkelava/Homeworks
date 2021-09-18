#include <iostream>
#include <vector>
#include <algorithm>
#include <utility>


using namespace std;

typedef unsigned long long ull;
typedef long long ll;
typedef vector<ll> vi;
typedef vector<vector<ll>> vvi;

void SingleSource (ll s, vi &polje){
    for(ll i = 0;i < polje.size();i++) polje[i] = INT_MAX;
    polje[s] = 0;
}

// Funkcija relax u obliku dfs-a
void Relax(vvi &L,ll a, vi &dosao,vi &polje){
    for(ll i = 0;i < L[a].size();i++){
        //Ako je L[a][i] = -1, onda mi node a ne susjeduje s nodeom i, pa nemoj provjeravati
        if(L[a][i] != -1) {
            if (polje[i] > polje[a] + L[a][i]) {
                polje[i] = polje[a] + L[a][i];
                dosao[i] = a;
                Relax(L, i, dosao, polje);
            }
        }
    }
}

bool bellmanford(vvi &L, ll s, ll t, vi &polje){
    SingleSource(s,polje);

    vi dosao(polje.size());
    dosao[s] = s;

    Relax(L,s,dosao,polje);

    for(ll i = 0;i < polje.size();i++){
        for(ll j = 0;j < L[i].size();j++){
            if(L[i][j] != -1){
                if(polje[j] > polje[i] + L[i][j]) return false;
            }
        }
    }
    return true;
}


int main() {
    ll N; cin >> N;
    vi rezultati(N);
    for(ll i = 0; i < N;i++) {
        ull n, m, S, T;
        cin >> n >> m >> S >> T;
        vvi L(n, vector<ll>(n));
        vi dolazak(n);
        for (ll j = 0; j < L.size(); j++) {
            for (ll ii = 0; ii < L[j].size(); ii++) {
                L[j][ii] = -1;
            }
        }

        for (ll j = 0; j < m; j++) {

            ll a, b, ms;
            cin >> a >> b >> ms;
            L[a][b] = ms;
            L[b][a] = ms;
        }

        bool flag = bellmanford(L, S, T, dolazak);


        if (flag && m > 0) {
            rezultati[i] = dolazak[T];
        }

    }


    for(ll i = 0;i < N;i++){
        cout << "Case #" << i+1 << ": ";
        if(rezultati[i] > 0)  cout << rezultati[i] << endl;
        else cout << "unreachable" << endl;
    }

    return 0;
}