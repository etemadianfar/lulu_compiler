grammar aaa;
expr: ID '=' ';';


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
