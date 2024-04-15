/* Bruno Grohs Vergara e João Pedro Ferreira Pereira
   Prof. Lucas M. Schnorr - Compiladores - Turma B - 2024/1 */
%{
#include <stdio.h>
int yylex(void);
void yyerror (char const *mensagem);
%}

%token TK_PR_INT
%token TK_PR_FLOAT
%token TK_PR_BOOL
%token TK_PR_IF
%token TK_PR_ELSE
%token TK_PR_WHILE
%token TK_PR_RETURN
%token TK_OC_LE
%token TK_OC_GE
%token TK_OC_EQ
%token TK_OC_NE
%token TK_OC_AND
%token TK_OC_OR
%token TK_IDENTIFICADOR
%token TK_LIT_INT
%token TK_LIT_FLOAT
%token TK_LIT_FALSE
%token TK_LIT_TRUE
%token TK_ERRO



%%

    program:                    elements_list
                                |
                                ;
    
    elements_list:              elements_list element
                                | element
                                ;
    
    element:                    global_declaration 
                                | function_definition
                                ;
    
    global_declaration:         type identifier_list ','
                                ;
    
    identifier_list:            identifier 
                                | identifier_list ';' identifier
                                ;
    
    function_definition:        function_header function_body
                                ;
    
    function_header:            '(' parameters_list ')' TK_OC_OR type '/' identifier
                                ;
    
    parameters_list:            parameters_list ';' parameter 
                                | parameter
                                |
                                ;
    
    parameter:                  type identifier
                                ;
    
    function_body:              command_block 
                                | '{' '}'
                                ;
    
    command_block:              '{' command_block command',' '}' 
                                | '{' command',' '}'
                                ;
    
    command:                    variable_declaration 
                                | attribution
                                | control_flow_construction
                                | return_operation 
                                | command_block
                                | function_call
                                ;
    
    variable_declaration:       type identifier_list
                                ;
    
    attribution:                identifier '=' expression
                                ;
    
    function_call:              identifier '('arguments_list')'
                                ;
    
    arguments_list:             arguments_list';' argument 
                                | argument
                                |
                                ;
    
    argument:                   expression
                                ;
    
    return_operation:           TK_PR_RETURN expression
                                ;
    
    control_flow_construction:  TK_PR_IF '(' expression ')' command_block
                                | TK_PR_IF '(' expression ')' command_block TK_PR_ELSE command_block
                                | TK_PR_WHILE '(' expression ')' command_block
                                ;
    
    expression:                 expression TK_OC_OR expression2 
                                | expression2
                                ;
    
    expression2:                expression2 TK_OC_AND expression3 
                                | expression3
                                ;
    
    expression3:                expression3 TK_OC_EQ expression4 
                                | expression3 TK_OC_NE expression4
                                | expression4
                                ;
    
    expression4:                expression4 TK_OC_LE expression5 
                                | expression4 TK_OC_GE expression5
                                | expression4 '<' expression5 
                                | expression4 '>' expression5
                                | expression5
                                ;
                                
    expression5:                expression5 '+' expression6 
                                | expression5 '-' expression6
                                | expression6
                                ;
    
    expression6:                expression6 '*' expression7 
                                | expression6 '/' expression7
                                | expression6 '%' expression7 
                                | expression7
                                ;
                                
    expression7:                '!' expression8 
                                | '-' expression8
                                | expression8
                                ;
    
    expression8:                '(' expression ')' 
                                | operand
                                ;
    
    operand:                    identifier 
                                | literal
                                | function_call
                                ;
    
    type:                       TK_PR_INT 
                                | TK_PR_FLOAT
                                | TK_PR_BOOL
                                ;
    
    identifier:                 TK_IDENTIFICADOR
                                ;
    
    literal:                    TK_LIT_INT 
                                | TK_LIT_FLOAT
                                | TK_LIT_TRUE
                                | TK_LIT_FALSE
                                ;    
%%

void yyerror (char const *mensagem)
{
    printf("%s", mensagem);
}
