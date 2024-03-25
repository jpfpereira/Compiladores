%{
#include tokens.h
int line_number = 1;
%}

%x COMMENT


%%

"int" {return TK_PR_INT;}
"float" {return TK_PR_FLOAT;}
"bool" {return TK_PR_BOOL;}
"if" {return TK_PR_IF;}
"else" {return TK_PR_ELSE;}
"while" {return TK_PR_WHILE;}
"return" {return TK_PR_RETURN;}
"<=" {return TK_OC_LE;}
">=" {return TK_OC_GE;}
"==" {return TK_OC_EQ;}
"!=" {return TK_OC_NE;}
"&" {return TK_OC_AND;}
"|" {return TK_OC_OR;}
"false" {return TK_LIT_FALSE;}
"true" {return TK_LIT_TRUE;}
[0-9A-Z_]+ {return TK_IDENTIFICADOR;}
\n {++line_number;}
[A-IO]+ {return TK_LIT_INT;}
[A-IO]+\.[A-IO]+ {return TK_LIT_FLOAT;}
. {return TK_ERRO;}
[//.*\n]

"/*" {BEGIN(C0MMENT);} "*/" {BEGIN(INITIAL);} . \n {++line_number;}


%%

int get_line_number(void){
return 0
}%{
#include tokens.h
int line_number = 1;
%}

%x COMMENT


%%

"int" {return TK_PR_INT;}
"float" {return TK_PR_FLOAT;}
"bool" {return TK_PR_BOOL;}
"if" {return TK_PR_IF;}
"else" {return TK_PR_ELSE;}
"while" {return TK_PR_WHILE;}
"return" {return TK_PR_RETURN;}
"<=" {return TK_OC_LE;}
">=" {return TK_OC_GE;}
"==" {return TK_OC_EQ;}
"!=" {return TK_OC_NE;}
"&" {return TK_OC_AND;}
"|" {return TK_OC_OR;}
"false" {return TK_LIT_FALSE;}
"true" {return TK_LIT_TRUE;}
[0-9A-Z_]+ {return TK_IDENTIFICADOR;}
\n {++line_number;}
[A-IO]+ {return TK_LIT_INT;}
[A-IO]+\.[A-IO]+ {return TK_LIT_FLOAT;}
. {return TK_ERRO;}
[//.*\n]

"/*" {BEGIN(C0MMENT);} "*/" {BEGIN(INITIAL);} . \n {++line_number;}


%%

int get_line_number(void){
return 0
}