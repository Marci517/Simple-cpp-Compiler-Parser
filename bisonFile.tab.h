/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     INT = 258,
     FLOAT = 259,
     VARIABLE = 260,
     MINUS = 261,
     PLUS = 262,
     MOD = 263,
     DIVIDE = 264,
     MULTIPLY = 265,
     IF = 266,
     ELSE = 267,
     WHILE = 268,
     LPAREN = 269,
     RPAREN = 270,
     LBRACE = 271,
     RBRACE = 272,
     INT_TYPE = 273,
     FLOAT_TYPE = 274,
     SEMICOLON = 275,
     ASSIGN = 276,
     EQUAL = 277,
     LESS = 278,
     GREATER = 279,
     NOT_EQUAL = 280,
     AND = 281,
     OR = 282,
     OUTPUT = 283
   };
#endif
/* Tokens.  */
#define INT 258
#define FLOAT 259
#define VARIABLE 260
#define MINUS 261
#define PLUS 262
#define MOD 263
#define DIVIDE 264
#define MULTIPLY 265
#define IF 266
#define ELSE 267
#define WHILE 268
#define LPAREN 269
#define RPAREN 270
#define LBRACE 271
#define RBRACE 272
#define INT_TYPE 273
#define FLOAT_TYPE 274
#define SEMICOLON 275
#define ASSIGN 276
#define EQUAL 277
#define LESS 278
#define GREATER 279
#define NOT_EQUAL 280
#define AND 281
#define OR 282
#define OUTPUT 283




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 32 "bisonFile.y"
{
    int ival;
    float fval;
    char *sval;
    char *types;
}
/* Line 1529 of yacc.c.  */
#line 112 "bisonFile.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

