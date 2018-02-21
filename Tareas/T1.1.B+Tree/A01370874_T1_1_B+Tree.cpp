/*
    Mauricio Rico Zavala
    A01370874
    21-02-18
    " b+ tree in c++ "
*/

////////////////////////////////////////////////////////
/*
     code for B+ method in c++ implemented from:
     http://www.sanfoundry.com/cpp-program-to-implement-b-tree/
*/
////////////////////////////////////////////////////////

#include<stdio.h>
#include<iostream>
#include<conio.h>

using namespace std;

///////////////// FUNCTION DECLARATIONS /////////////////

Node * init();
void sort(int * data, int num);
int split(Node * nodeTemp, int i);
void insert(int number);

///////////////// FUNCTION DEFINITIONS /////////////////

// Struct para el node
struct Node_struct{
    // Variables
    int * datos;
    Node ** child;
    bool leaf;
    int num;

} *root = NULL, *nodeTemp = NULL, *node = NULL; // Resultado del node

// Initialization of a node
Node * init(){
    // Variables
    node = new Node;
    node->datos = new int[5];
    node->child = new Node *[6]; // pointer
    node->leaf = true;
    node->num = 0;

    // loop to null the pointers
    for (int i = 0; i < 6, i++){
        node->child[i] = NULL;
    }

    return node; // initialized
}

// Sorting function
void sort(int * data, int num){
    // Variable
    int temp;
    // For loops to loop and sort given data
    for(int i = 0; i < num; i++){
        for(int j = i; j <= num; j++ ){
            if(data[i] > data[j]){
                temp = p[i];
                p[i] = p[j];
                p[j] = temp;
            }
        }
    }
}

// Function to printTree leafs from the tree
void printTree (Node *s) {

    cout << endl; // formating

    // Loops through the data array and prints the contents if the leaf boolean is true
    for(int i = 0; i < s->n; i++){
        if(s->leaf == false){
            printTree(s->child[i]);
        }
        cout << " " << s->data[i];
    }

    // calls back the funcion if the lead boolean is false
    if(s->leaf == false){
        printTree(s->child[i]);
    }

    cout << endl; // formating
}

int split(Node * nodeTemp, int i){
    // TODO: terminar funcion de separar

    return 0;
}
void insert(int number){
    // TODO: terminar funcion para insertar numero
}

// Main function of the program
int main(int argc, char const *argv[]) {
    // Variables
    int n;
    int input;
    // Menu
    std::cout << "-------------------------\n";
    std::cout << "B+ TREE PROGRAM IN C++\n";
    std::cout << "-------------------------\n";
    std::cout << endl;
    std::cout << endl;
    std::cout << "Please enter the total number of elements in the tree:";
    cin >> n;
    // For loop to enter the numbers
    for(int i = 0; i < n; i++) {
        cout << endl;
        cout << "Please enter the element to insert\n";
        cin >> input;
        insert(input);
    }

    // Prints the tree
    cout<<"Tree:\n";
    cout << endl;
    printTree(root);

    return 0;
}
