/*
Autor: Gerardo Osio

ANTLR4 reserved words:
import, fragment, lexer, parser, grammar, returns,
locals, throws, catch, finally, mode, options, tokens.

Sail reserved words:
sail, Sail, var, print, func, return, for, in, to, through, by, if, else, while,
Bool, Int, Float, String, Character, Void.
*/

grammar Sail;

/*
 * Parser
 */

program             : declaration* SAIL block EOF ;

declaration         : variable | function ;
block               : OPEN_CURLY statement* CLOSE_CURLY ;
statement           : assignment | condition | loop | printStmt | (call SEMICOLON) ;

assignment          : IDENTIFIER (OPEN_BRACKET expression CLOSE_BRACKET)? ASSIGN (logicExp | letterLiteral) SEMICOLON ;

condition           : IF OPEN_PARENTHESIS logicExp CLOSE_PARENTHESIS conditionAction block (conditionElseAction ELSE block)? ;
conditionAction     : ;
conditionElseAction : ;

loop                : forStmt | whileStmt ;
forStmt             : FOR IDENTIFIER IN expression forStride expression BY expression block ;
forStride           : TO | THROUGH ;
whileStmt           : WHILE OPEN_PARENTHESIS logicExp CLOSE_PARENTHESIS conditionAction block ;

printStmt           : PRINT OPEN_PARENTHESIS (logicExp | letterLiteral | call) CLOSE_PARENTHESIS SEMICOLON ;

variable            : VAR IDENTIFIER (OPEN_BRACKET CONSTANT_INT CLOSE_BRACKET)? COLON type SEMICOLON ;
type                : BOOL | INT | FLOAT | CHARACTER | STRING ;

function            : FUNC IDENTIFIER OPEN_PARENTHESIS parameters? CLOSE_PARENTHESIS ARROW (type | VOID) OPEN_CURLY statement* (RETURN literal SEMICOLON)? CLOSE_CURLY ;
parameters          : parameter (COMMA parameter)* ;
parameter           : IDENTIFIER COLON type ;

call                : IDENTIFIER OPEN_PARENTHESIS (expression (COMMA expression)*)? CLOSE_PARENTHESIS ;

// Expression

logicExp            : relationalExp logicExpP? ;
logicExpP           : (AND | OR) logicExp ;

relationalExp       : expression relationalExpP? ;
relationalExpP      : relationalOp relationalExp;
relationalOp        : EQUAL | EQUAL_GREATER_THAN | EQUAL_LESS_THAN | GREATER_THAN | LESS_THAN | NOT_EQUAL ;

expression          : term expressionP? ;
expressionP         : (PLUS | MINUS) expression ;

term                : factor termP? ;
termP               : (MULTIPLICATION | DIVISION) term ;

factor              : varLiteral | (OPEN_PARENTHESIS logicExp CLOSE_PARENTHESIS) ;

literal             : varLiteral | letterLiteral ;
varLiteral          : IDENTIFIER | MINUS? CONSTANT_INT | MINUS? CONSTANT_FLOAT | CONSTANT_BOOLEAN ;
letterLiteral       : CONSTANT_CHAR | CONSTANT_STRING ;

/*
 * Lexer
 */

SAIL        : 'sail' | 'Sail' ;

// Types
INT         : 'Int' ;
FLOAT       : 'Float' ;
BOOL        : 'Bool' ;
CHARACTER   : 'Character' ;
STRING      : 'String' ;
VOID        : 'Void' ;

// Reserved words
VAR         : 'var' ;
PRINT       : 'print' ;
FUNC        : 'func' ;
RETURN      : 'return' ;
IF          : 'if' ;
ELSE        : 'else' ;
WHILE       : 'while' ;
FOR         : 'for' ;
IN          : 'in' ;
TO          : 'to' ;
THROUGH     : 'through' ;
BY          : 'by' ;

// Operators
DIVISION            : '/' ;
MINUS               : '-' ;
MULTIPLICATION      : '*' ;
PLUS                : '+' ;

AND                 : '&&' ;
ASSIGN              : '=' ;
EQUAL               : '==' ;
EQUAL_GREATER_THAN  : '>=' ;
EQUAL_LESS_THAN     : '<=' ;
GREATER_THAN        : '>' ;
LESS_THAN           : '<' ;
NOT                 : '!' ;
NOT_EQUAL           : '!=' ;
OR                  : '||' ;

// Quotation Marks
OPEN_BRACKET        : '[' ;
CLOSE_BRACKET       : ']' ;
OPEN_CURLY          : '{' ;
CLOSE_CURLY         : '}' ;
OPEN_PARENTHESIS    : '(' ;
CLOSE_PARENTHESIS   : ')' ;

ARROW       : '->' ;
COLON       : ':' ;
COMMA       : ',' ;
DOT         : '.' ;
SEMICOLON   : ';' ;

// Constants
CONSTANT_INT         : DIGIT+ ;
CONSTANT_FLOAT       : (DOT DIGIT+ | DIGIT+ ( DOT DIGIT* )?) ;
CONSTANT_BOOLEAN     : 'true' | 'false' ;
CONSTANT_CHAR        : SINGLE_QUOTE CHAR SINGLE_QUOTE ;
CONSTANT_STRING      : DOUBLE_QUOTE CHAR* DOUBLE_QUOTE ;

IDENTIFIER  : [a-zA-Z] ([a-zA-Z0-9_])* ;
COMMENTS    : '//' ~ [\r\n]* -> skip ;
WHITESPACE  : [ \t]+ -> skip ;
NEWLINE     : ('\r' '\n'? | '\n') -> skip ;

fragment DOUBLE_QUOTE   : '"' ;
fragment SINGLE_QUOTE   : '\'' ;
fragment SIGN           : '+' | '-' ;
fragment DIGIT          : [0-9] ;
fragment LETTER         : [a-zA-Z\u0080-\u00FF_] ;
fragment CHAR           : ~ ["\\\r\n] | LETTER ;
