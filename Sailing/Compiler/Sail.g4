/*
Autor: Gerardo Osio

ANTLR4 reserved words:
import, fragment, lexer, parser, grammar, returns,
locals, throws, catch, finally, mode, options, tokens.

Sail reserved words:
sail, func, return, for, in, to, through, by, if, while,
Bool, Int, String, Character.
*/

grammar Sail;

/*
 * Parser
 */

program             : 'sail' IDENTIFIER block ;

block               : '{' statute* '}' ;
statute             : basicStatute | function ;
basicStatute        : statement | variables ;
statement           : assignment | condition | loop | print | functionCall ;

assignment          : IDENTIFIER '=' (logicExp | stringLiteral) ';' ;

condition           : 'if' '(' logicExp ')' conditionStmt ('else' conditionStmt)? ;
conditionStmt       : '{' statement '}' ;

loop                : forStmt | whileStmt ;
forStmt             : 'for' IDENTIFIER 'in' varLiteral forStride varLiteral 'by' varLiteral '{' statement '}' ;
forStride           : 'to' | 'through' ;
whileStmt           : 'while' '(' logicExp ')' '{' statement '}' ;

print               : 'print' '(' (logicExp | stringLiteral | functionCall) ')' ';' ;

variables           : 'var' IDENTIFIER (',' IDENTIFIER)* ':' type ';' ;

type                : typeSpec | '[' typeSpec ']' ;
typeSpec            : 'Bool' | 'Int' | 'Float' | 'Character' | 'String' ;

function            : 'func' IDENTIFIER '(' parameters? ')' ('->' type)? '{' basicStatute+ ('return' IDENTIFIER ';')? '}' ;
parameters          : parameter (',' parameter)* ;
parameter           : IDENTIFIER ':' type ;

functionCall        : IDENTIFIER '(' parametersDec? ')' ;
parametersDec       : literal (',' literal)* ;

// Expression

logicExp            : relationalExp logicExpP? ;
logicExpP           : ('&&' | '||') logicExp ;

relationalExp       : expression relationalExpP? ;
relationalExpP      : relationalOp expression ;
relationalOp        : '<' | '>' | '==' | '<=' | '>=' | '!=' ;

expression          : term expressionP? ;
expressionP         : ('+' | '-') expression ;

term                : factor termP? ;
termP               : ('*' | '/') term ;

factor              : varLiteral | ('(' logicExp ')') ;

literal             : varLiteral | stringLiteral ;
varLiteral          : IDENTIFIER | INT | FLOAT | BOOLEAN ;
stringLiteral       : STRING ;

/*
 * Lexer
 */

fragment DIGIT  : [0-9] ;
fragment LETTER : [a-zA-Z\u0080-\u00FF_] ;
fragment CHAR   : ~ ["\\\r\n] | LETTER ;

IDENTIFIER  : LETTER (LETTER | DIGIT)* ;
INT         : DIGIT+ ;
FLOAT       : [-|+]? ( '.' DIGIT+ | DIGIT+ ( '.' DIGIT* )? ) ;
BOOLEAN     : 'true' | 'false' ;
STRING      : '"' CHAR* '"' ;

// WORD        : LETTER|DIGIT * ;
WHITESPACE  : [ \t]+ -> skip ;
NEWLINE     : ('\r' '\n'? | '\n') -> skip ;
COMMENTS    : '//' ~ [\r\n]* -> skip ;
