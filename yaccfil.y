%{
int yylex();
void yyerror(const char *ch);     
#include<stdio.h> 
#include<math.h>
extern FILE *yyin;
%}
%union{
float real;
}
%token <real> NUMBER 
%token to cm m ft inch km of msec kmhr s min hr
%type <real> S E Z Y U V X H I J K L
%%
S: E    {$$=$1;};   

E: m to Z   {$$=$3;};
    |cm to Y   {$$=$3;};
    |km to X   {$$=$3;};
    |ft to U   {$$=$3;};
    |inch to V   {$$=$3;};
    |msec to L   {$$=$3;};
    |kmhr to K   {$$=$3;};
    |s to J   {$$=$3;};
    |min to I   {$$=$3;};
    |hr to H   {$$=$3;};
    ;

Z: km of NUMBER         {   $$=$3/1000;    printf("%f m to km is %f km\n",$3,$$); };
    |cm of NUMBER       {   $$=$3*100;     printf("%f m to cm is %f cm\n",$3,$$); };
    |inch of NUMBER     {   $$=$3*39.37; printf("%f m to inch is %f inches\n",$3,$$); };
    |ft of NUMBER       {   $$=$3*3.281;  printf("%f m to ft is %f ft\n",$3,$$); };
    |s of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |min of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |hr of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |msec of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |kmhr of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};    
    ;

Y: km of NUMBER         {   $$=$3/100000;    printf("%f cm to km is %f km\n",$3,$$); };
    |m of NUMBER       {   $$=$3/100;     printf("%f cm to m is %f m\n",$3,$$); };
    |inch of NUMBER     {   $$=$3/2.54; printf("%f cm to inch is %f inches\n",$3,$$); };
    |ft of NUMBER       {   $$=$3/30.48;  printf("%f cm to ft is %f ft\n",$3,$$); };
    |s of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |min of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |hr of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |msec of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |kmhr of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    ;

X: cm of NUMBER         {   $$=$3*100000;    printf("%f km to cm is %f cm\n",$3,$$); };
    |m of NUMBER       {   $$=$3*1000;     printf("%f km to m is %f m\n",$3,$$); };
    |inch of NUMBER     {   $$=$3*39370; printf("%f km to inch is %f inches\n",$3,$$); };
    |ft of NUMBER       {   $$=$3*3281;  printf("%f km to ft is %f ft\n",$3,$$); };
    |s of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |min of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |hr of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |msec of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |kmhr of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    ;   

U: cm of NUMBER         {   $$=$3*30.48;    printf("%f ft to cm is %f cm\n",$3,$$); };
    |m of NUMBER       {   $$=$3/3.281;     printf("%f ft to m is %f m\n",$3,$$); };
    |inch of NUMBER     {   $$=$3*12; printf("%f ft to inch is %f inches\n",$3,$$); };
    |km of NUMBER       {   $$=$3/3281;  printf("%f ft to km is %f km\n",$3,$$); };
    |s of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |min of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |hr of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |msec of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |kmhr of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    ;

V: cm of NUMBER         {   $$=$3*2.54;    printf("%f inch to cm is %f cm\n",$3,$$); };
    |m of NUMBER       {   $$=$3/39.37;     printf("%f inch to m is %f m\n",$3,$$); };
    |ft of NUMBER     {   $$=$3/12; printf("%f inch to ft is %f ft\n",$3,$$); };
    |km of NUMBER       {   $$=$3/39370;  printf("%f inch to km is %f km\n",$3,$$); };
    |s of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |min of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |hr of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |msec of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |kmhr of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    ;

I:s of NUMBER      {   $$=$3*60;    printf("%f min to s is %f s\n",$3,$$); }; 
    |km of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |m of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |cm of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |inch of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |ft of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |kmhr of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |msec of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |hr of NUMBER    {  $$=$3/60;    printf("%f min to hr is %f hr\n",$3,$$);};
    ;

H:min of NUMBER      {   $$=$3*60;    printf("%f hr to min is %f min\n",$3,$$); }; 
    |km of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |m of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |cm of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |inch of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |ft of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |kmhr of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |msec of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |s of NUMBER    {  $$=$3*3600;    printf("%f hr to s is %f s\n",$3,$$);};
    ;


J:min of NUMBER      {   $$=$3/60;    printf("%f s to min is %f min\n",$3,$$); }; 
    |km of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |m of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |cm of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |inch of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |ft of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |kmhr of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |msec of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |hr of NUMBER    {  $$=$3/3600;    printf("%f s to hr is %f hr\n",$3,$$);};
    ;

L:kmhr of NUMBER      {   $$=$3*3.6;    printf("%f msec to kmhr is %f kmhr\n",$3,$$); }; 
    |km of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |m of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |cm of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |inch of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |ft of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |hr of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |min of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |s of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    ;

K:msec of NUMBER      {   $$=$3/3.6;    printf("%f kmhr to msec is %f msec\n",$3,$$); }; 
    |km of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |m of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |cm of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |inch of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |ft of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |hr of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |min of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    |s of NUMBER    { printf("ERROR:Invalid Conversion Types \n");};
    ;

%%
void yyerror(const char *ch){
}
int main(int argc, char *argv[]) 
{
yyin=fopen(argv[1],"r");
int i;
for(i=1;i<=50;i++){
yyparse();
}
fclose(yyin);
return 0;
}