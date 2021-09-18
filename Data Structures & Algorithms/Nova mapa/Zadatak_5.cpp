#include <iostream>
#include <vector>
using namespace std;

class Graph{
private:
    int nodes;
    vector<vector<int>> edge;

public:
    Graph(int n): nodes{n} {

        for(int i = 0;i < n;i++){
            vector<int> temp(n);
            edge.push_back(temp);
        }
    }

    void addEdge(int n, int m){
        edge[n][m] = 1;
        edge[m][n] = 1;
    }

    void deleteEdege(int n,int m){
        edge[n][m] = 0;
        edge[m][n] = 0;
    }

    void susjedi(){
        cout << "[ ";
        for(int i = 0;i < nodes;i++){
            for(int j = 0;j < nodes;j++){
                if(edge[i][j] == 1) cout << "(" << i << " " << j << ") ";
            }
        }

        cout << "]" << endl;
    }

    void bridovi(){
        for(int i = 0;i < nodes;i++){
            cout << i << " : [ ";
            for(int j = 0;j < nodes;j++){
                if(edge[i][j] == 1) cout << j << " ";
            }
            cout << "]" << endl;
        }
    }




};


int main() {
    int n; cin >> n;
    Graph G(n);
    G.addEdge(2,3);
    G.addEdge(1,3);
    G.addEdge(4,6);
    G.susjedi();
    G.bridovi();
    return 0;
}