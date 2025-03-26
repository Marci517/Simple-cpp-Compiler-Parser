%{
#include<iostream>
#include "bisonFile.tab.h"
#include <unordered_map>

using namespace std;

int col = 1;
void logMessage(string message)
{
    col = col + yyleng;
}

unordered_map<string, string> symbol_table;
extern YYSTYPE yylval;
int yylex();

%}

%option noyywrap
%option yylineno
%%

(0|-?[1-9][0-9]*)\.[0-9]+ {
    logMessage("FLOAT value");
    yylval.fval = atof(yytext);
    return FLOAT;
}

0|-?[1-9][0-9]* {
    logMessage("INT value");
    yylval.ival = atoi(yytext);
    return INT;
}

\n {
    col = 1;
}

[\t] {
    col = col + yyleng;
}

" " {
    col = col + yyleng;
}

&& {
    logMessage("AND operator");
    return AND;
}

"||" {
    logMessage("OR operator");
    return OR;
}

if {
    logMessage("IF keyword");
    return IF;
}

else {
    logMessage("ELSE keyword");
    return ELSE;
}

while {
    logMessage("WHILE keyword");
    return WHILE;
}

"+" {
    logMessage("Arithmetic PLUS operator");
    return PLUS;
}

- {
    logMessage("Arithmetic MINUS operator");
    return MINUS;
}

"*" {
    logMessage("Arithmetic MULTIPLY operator");
    return MULTIPLY;
}

"/" {
    logMessage("Arithmetic DIVIDE operator");
    return DIVIDE;
}

"%" {
    logMessage("Arithmetic MOD operator");
    return MOD;
}

= {
    logMessage("EQUAL operator");
    return ASSIGN;
}

== {
    logMessage("EQUALITY operator");
    return EQUAL;
}

!= {
    logMessage("NOT EQUAL operator");
    return NOT_EQUAL;
}

">" {
    logMessage("GREATER THAN operator");
    return GREATER;
}

"<" {
    logMessage("LESS THAN operator");
    return LESS;
}

int {
    logMessage("Integer type");
    return INT_TYPE;
}

float {
    logMessage("Floating-point type");
    return FLOAT_TYPE;
}

"{" {
    logMessage("Opening curly brace");
    return LBRACE;
}

"}" {
    logMessage("Closing curly brace");
    return RBRACE;
}

"(" {
    logMessage("Opening parenthesis");
    return LPAREN;
}

")" {
    logMessage("Closing parenthesis");
    return RPAREN;
}

";" {
    logMessage("Semicolon");
    return SEMICOLON;
}

"<<" {
    logMessage("Output operator");
    return OUTPUT;
}

[a-zA-Z][a-zA-Z0-9]* {
    logMessage("VARIABLE");
    yylval.sval = strdup(yytext);
    return VARIABLE;
}

. {
    logMessage("undefined");
}

%%
