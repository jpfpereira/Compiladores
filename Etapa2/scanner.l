/* Bruno Grohs Vergara e João Pedro Ferreira Pereira
   Prof. Lucas M. Schnorr - Compiladores - Turma B - 2024/1 */
%{
#include "tokens.h"
int line_number = 1;
int yylineno;
%}

%x BIG_COMMENT
%x LINE_COMMENT

%option yylineno
%option noyywrap

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

[-!*/%+<>{}()=,;] {return yytext[0];}

"false" {return TK_LIT_FALSE;}
"true" {return TK_LIT_TRUE;}
[a-z_][0-9a-z_]* {return TK_IDENTIFICADOR;}
[0-9]+ {return TK_LIT_INT;}
[0-9]*\.[0-9]+ {return TK_LIT_FLOAT;}

\n {++line_number;}

"/*" {BEGIN(BIG_COMMENT);}
"//" {BEGIN(LINE_COMMENT);}

. {return TK_ERRO;}

<BIG_COMMENT>"*/" {BEGIN(INITIAL);}
<BIG_COMMENT>.

<LINE_COMMENT>.
<LINE_COMMENT>\n {BEGIN(INITIAL);}

%%

#include "main.c"
    
int get_line_number(void){
    return yylineno;
}
