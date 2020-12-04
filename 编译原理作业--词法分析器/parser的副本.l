%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>
	int line=1;
%}
LETTER [a-zA-Z]
ID ({LETTER}|_)({LETTER}|_|{DIGIT})* 
OPT ("*"|"/"|"+="|"-="|"*="|"/="|">="|"<="|"=="|">"|"<"|"++"|"--")
ASSIGN ("=") 
ADD ("+")
LESS ("<")
MORE (">")
MINUS ("-")
SEMICOLON (";")
BRACKET ("["|"]"|"#")
LP ("(")
RP (")")
LBRACE ("{")
RBRACE ("}")
DIGIT [0-9]
OINTEGER [1-9]{DIGIT}*
INTEGER ("+"|"-")?{OINTEGER}
DECIMAL {INTEGER}(.{OINTEGER})
FLOAT ([0-9])*+[.]([0-9])*+[Ee]([+-]?[0-9]([0-9])*|[0])
ERROEFLOAT ([0-9])*+[.](0-9)*+("E"|"e")
TYPE void|int|double|char
KEYWORD if|else|do|while|for|scanf|printf|sqrt|abs|main|return|float
TYPEIDENTIFY %d|%c|%s|%f|&{ID}
SGPS \/\/.*
DBPS \/\*(.|\n)*\*\/ 

%%
\n {++line;}
{MINUS} {printf("line%d:(MINUS, %s)\n",line,yytext);}
{MORE} {printf("line%d:(MORE, %s)\n",line,yytext);}
{LESS} {printf("line%d:(LESS, %s)\n",line,yytext);}
{SEMICOLON} {printf("line%d:(SEMICOLON, %s)\n",line,yytext);}
{ADD} {printf("line%d:(ADD, %s)\n",line,yytext);}
{ASSIGN} {printf("line%d:(ASSIGN, %s)\n",line,yytext);}
{LP} {printf("line%d:(LP, %s)\n",line,yytext);}
{RP} {printf("line%d:(RP, %s)\n",line,yytext);}
{LBRACE} {printf("line%d:(LBRACE, %s)\n",line,yytext);}
{RBRACE} {printf("line%d:(RBRACE, %s)\n",line,yytext);}
{TYPE} {printf("line%d:(TYPE, %s)\n",line,yytext);}
{KEYWORD} {printf("line%d:(keyword, %s)\n",line,yytext);}
{DIGIT} {printf("line%d:(NUMBER, %s)\n",line,yytext);} 
{OINTEGER} {printf("line%d:ONUMBER, %s)\n",line,yytext);}
{ID} {printf("line%d:(ID, %s)\n",line,yytext);} 
{BRACKET} {printf("line%d:(BRACKET, %s)\n",line,yytext);} 
{OPT} {printf("line%d:(OPT, %s)\n",line,yytext);}
{INTEGER} {printf("line%d:(integer, %s)\n",line,yytext);}
{DECIMAL} {printf("line%d:(decimal, %s)\n",line,yytext);}
{FLOAT} {printf("line%d:(float, %s)\n",line,yytext);}
{TYPEIDENTIFY} {printf("line%d:(typeidentify, %s)\n",line,yytext);}
{ERROEFLOAT} {printf("ERROEFLOAT\n");}
({SGPS}|{DBPS}) {}
. {}
[ \t]+ {}

%%
int main(){
	yyin=fopen("./data.txt","r");
	yylex();
	return 0;
}
int yywrap(){
	return 1;
}