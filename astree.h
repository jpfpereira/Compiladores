/* Bruno Grohs Vergara e João Pedro Ferreira Pereira
   Prof. Lucas M. Schnorr - Compiladores - Turma B - 2024/1 */

#ifndef TREE_H
#define TREE_H

#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    struct Node* parent; 
    struct Node* child; 
    struct Node* sibling; 
    LexicalValue* lexVal;
}


Node* createNode(LexicalValue* value);
void addChild(Node* parent, Node* child); 
LexicalValue* createLexicalValue(int lineNum, char* type, char* label)
void printAST(Node* root, int level);


#endif