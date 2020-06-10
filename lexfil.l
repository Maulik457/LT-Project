%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
[0-9]+  {
		printf("Number: %s\n", yytext,atoi( yytext ) );
		yylval.real=atoi(yytext);
		return NUMBER;
		}
[0-9]*\.[0-9]* {
		printf("Number: %s\n", yytext,atoi( yytext ) );
		yylval.real=(float)atof(yytext); 
		return NUMBER;
		}        
to      {
		printf("Keyword: %s\n", yytext );
		return to;
		}
of      {
		printf("Keyword: %s\n", yytext );
		return of;
		}
m       {
		printf("Unit: %s\n", yytext );
		return m;
		}
cm		{
		printf("Unit: %s\n", yytext );
		return cm;
		}
km      {
		printf("Unit: %s\n", yytext );
		return km;
		}
hr		{
		printf("Unit: %s\n", yytext );
		return hr;
		}
min		{
		printf("Unit: %s\n", yytext );
		return min;
		}
s		{
		printf("Unit: %s\n", yytext );
		return s;
		}
msec	{
		printf("Unit: %s\n", yytext );
		return msec;}
kmhr	{
		printf("Unit: %s\n", yytext );
		return kmhr;
		}
inch    {
		printf("Unit: %s\n", yytext );
		return inch;
		}
ft		{
		printf("Unit: %s\n", yytext );
		return ft;
		} 
[\n]	{return yytext;}
[/t]	;
[\n|\t]      printf("Newline/tab: %s\n",yytext);
%%
int yywrap(void){return 1;}