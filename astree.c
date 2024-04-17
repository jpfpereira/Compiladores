/* Bruno Grohs Vergara e João Pedro Ferreira Pereira
   Prof. Lucas M. Schnorr - Compiladores - Turma B - 2024/1 */

#include "astree.h"

// Function to create a new node with given lexical value
Node* createNode(LexicalValue* value) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    if (!newNode) {
        fprintf(stderr, "Out of memory error when creating a new node.\n");
        exit(1);
    }
    newNode->parent = NULL;
    newNode->child = NULL;
    newNode->sibling = NULL;
    newNode->lexVal = value;
    return newNode;
}

// Function to add a child to a node
void addChild(Node* parent, Node* child) {
    if (parent->child == NULL) {
        parent->child = child;
    } else {
        Node* temp = parent->child;
        while (temp->sibling != NULL) {
            temp = temp->sibling;
        }
        temp->sibling = child;
    }
    child->parent = parent;
}

// Function to create a new lexical value
LexicalValue* createLexicalValue(int lineNum, char* type, char* label) {
    LexicalValue* newLexVal = (LexicalValue*)malloc(sizeof(LexicalValue));
    if (!newLexVal) {
        fprintf(stderr, "Out of memory error when creating a lexical value.\n");
        exit(1);
    }
    newLexVal->lineNum = lineNum;
    newLexVal->type = strdup(type);
    newLexVal->label = strdup(label);
    return newLexVal;
}

// Function to print the AST for debugging
void printAST(Node* root, int level) {
    if (root == NULL) return;
    for (int i = 0; i < level; i++) printf("  ");
    printf("Node (%s, %s, Line %d)\n", root->lexVal->type, root->lexVal->label, root->lexVal->lineNum);
    printAST(root->child, level + 1);
    printAST(root->sibling, level);
}