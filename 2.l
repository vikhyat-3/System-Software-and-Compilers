
//LEX
%{
#include "y.tab.h"
%}
%%
a return A;
b return B;
. return yytext[0];
\n return yytext[0];
%%

//YACC PART
%{
/* Yacc program to recognize the grammar AnB */
	#include<stdio.h>
	#include<stdlib.h>
	int yyerror();
%}
%token A B
%%
str: s'\n' {printf("Valid String\n");}
;
s : x B
;
x : x A | A
;
%%
int main()
{
	printf(" Type the String ? \n");
	if(!yyparse())
	printf(" Valid String\n ");
}
int yyerror()
{
	printf(" Invalid String.\n");
	exit(0);
}
