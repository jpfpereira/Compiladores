%{
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


program: elements_list | ;
elements_list: elements_list element | element; 
element: global_declaration | function_definition;
global_declaration: type identifier_list,
identifier_list: identifier | identifier; identifier_list
function_definition: function_header function_body 
function_header: (parameters_list) TK_OC_OR type '/' identifier
parameters_list: parameter; parameters_list | parameter | ;
parameter: type identifier;
function_body: { command_block };
command_block: command command_block | ;
command: variable_declaration | attribution | control_flow_construction
            | return_operation | command_block | function_call

variable_declaration: type identifier_list;
attribution: identifier = expression;
function_call: identifier (arguments_list);
arguments_list: identifier; arguments_list | identifier | ;
return_operation: TK_PR_RETURN expression; 
control_flow_construction: TK_PR_IF (expression) command_block  
                            | TK_PR_IF (expression) command_block else command_block
                            | TK_PR_WHILE (expression) command_block

expression: operand 
            | unary_operator expression 
            | expression binary_operator expression;

operand: identifier | literal | function_call

unary_operator: - | !

binary_operator: +
                | -
                | *
                | / 
                | %
                | <
                | >
                | TK_OC_LE
                | TK_OC_GE
                | TK_OC_EQ
                | TK_OC_NE
                | TK_OC_AND
                | TK_OC_OR


type: int | float | bool;
%%

void yyerror (chat const *mensagem)
{
    printf(mensagem)
}