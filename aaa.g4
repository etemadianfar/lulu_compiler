grammar aaa;


program: ft_dcl? ft_def+;
ft_dcl: DECLARE OCB ( func_dcl | type_dcl | var_def )+ CCB;
func_dcl: (OP args CP '=')? ID OP ( args | args_var )? CP SemiColon;
args: type (OP CP)*
    | args Comma type  (OB CB)*
    ;
args_var: type (OB CB)* ID
        | args_var Comma type (OB CB)* ID
        ;
type_dcl: ID SemiColon;
var_def: CONST? type var_val (Comma var_val)* SemiColon;
var_val: ref ('=' expr)?;
ft_def: (type_def | func_def);
type_def: TYPE ID (Colon ID)? OCB component+ CCB;
component: access_modifier? (var_def | func_def);
access_modifier: PRIVATE
                | PUBLIC
                | PROTECTED
                ;
func_def: (OP args_var CP '=')? FUNCTION ID OP args_var? CP block;
block: OCB (var_def | stmt)* CCB;
stmt: assign SemiColon
    | func_call SemiColon
    | cond_stmt
    | loop_stmt
    | BREAK SemiColon
    | CONTINUE SemiColon
    | DESTRUCT (OP CP)* ID SemiColon
    ;
assign: ( var | OP var (Comma var)* CP) '=' expr;
var: ((THIS | SUPER) Comma)? ref (Comma ref)*;
ref: ID (OB expr CB)*;
expr: expr binary_op expr
    | OP expr CP
    | unary_op expr
    | const_val
    | ALLOCATE handle_call
    | func_call
    | var
    | list
    | NIL
    ;
func_call: (var Comma)? handle_call
            | READ OP CP
            | WRITE OP expr CP
            ;
list: OB (expr | list) (SemiColon (expr | list))* CB;
handle_call: ID OP params? CP;
params: expr
        | expr Comma params
        ;
cond_stmt: IF expr (block | stmt) (ELSE (block | stmt))?
        | SWITCH var OCB switch_body CCB
        ;
switch_body: (CASEOF INT_CONST Colon block)+ (DEFAULT Colon block)?;
loop_stmt: FOR (type? assign)? SemiColon expr SemiColon assign? block
        | WHILE expr block
        ;

type: INT
    | BOOL
    | FLOAT
    | STRING
    | ID
    ;
const_val: INT_CONST
        | REAL_CONST
        | BOOL_CONST
        | STRING_CONST
        ;
unary_op: '-'
        | '!'
        | '~'
        ;
binary_op: arithmetic
        | relational
        | bitwise
        | logical
        ;
arithmetic: '+'
        | '-'
        | '*'
        | '/'
        | '%'
        ;
relational: '=='
        | '!='
        | '<='
        | '>='
        | '>'
        | '<'
        ;
bitwise: '&'
        | '|'
        ;
logical: '||'
        | '&&'
        ;


ID: [a-zA-Z]+[0-9]*
    | ('_'|'@') [a-zA-Z0-9]*
     ;
//keywords and reserved
ALLOCATE: 'allocate';
BOOL: 'bool';
BREAK: 'break';
CASEOF: 'caseof';
CONST: 'const';
CONTINUE: 'continue';
DECLARE: 'declare';
DEFAULT: 'default';
DESTRUCT: 'destruct';
ELSE: 'else';
FALSE: 'false';
FUNCTION: 'function';
FLOAT: 'float';
FOR: 'for';
IF: 'if';
INT: 'int';
NIL: 'nil';
PRIVATE: 'private';
PROTECTED: 'protected';
PUBLIC: 'public';
READ: 'read';
STRING: 'string';
SUPER: 'super';
SWITCH: 'switch';
THIS: 'this';
TRUE: 'true';
TYPE: 'type';
WHILE: 'while';
WRITE: 'write';

//operatores
Equal: '==';
NotEqual: '!=';
LTE: '<=';
LT: '<';
BT: '>';
BTE: '>=';
BitwiseNegetive: '~';
BitOr: '|';
BitAnd: '&';
LogicNot: '!';
LogicOr: '||';
LogicAnd: '&&';
Subtract: '-';
Add: '+';
Mult: '*';
Divid: '/';
Modulus: '%';

//structure operatores
OCB: '{';
CCB: '}';
OP: '(';
CP: ')';
OB: '[';
CB: ']';
Dot: '.';
Comma: ',';
Colon: ':';
SemiColon: ';';



INT_CONST:[0-9]+
        | '0'('X'|'x')([0-9]+|[a-fA-F])([0-9]+|[a-fA-F])
        ;
FLOAT_CONST: [0-9]+ '.';
BOOL_CONST:
            | 'true'
            | 'false'
            ;
WS: [ \t\n\r]+ -> skip;
BLOCK_COMMENT: '#(' .*? ')#' -> skip;
LINE_COMMENT: '#$' ~[\r\n]* -> skip;

