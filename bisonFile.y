%{
#include <iostream>
using namespace std;
extern int yylex();
extern int yylineno;
extern int col;
extern unordered_map<string, string> symbol_table;
void yyerror(string);

string getType(const string& a)
{
  auto i = symbol_table.find(a);
  if(i != symbol_table.end())
  {
    return i -> second;
  }
  return "undefined";
  
}

bool getExist(const string& a)
{
  auto i = symbol_table.find(a);
  if(i != symbol_table.end())
  {
    return true;
  }
  return false;
}

%}
%union {
    int ival;
    float fval;
    char *sval;
    char *types;
}
%type <types>  expression number element vl;

%token <ival> INT
%token <fval> FLOAT
%token <sval> VARIABLE

%left PLUS MINUS
%left MULTIPLY DIVIDE MOD

%token IF ELSE WHILE LPAREN RPAREN LBRACE RBRACE INT_TYPE FLOAT_TYPE SEMICOLON ASSIGN EQUAL
%token LESS GREATER NOT_EQUAL AND OR OUTPUT
%error-verbose
%%

program:
       | block
;

number: INT { cout << $1; } { $$ = strdup("int");}
    | FLOAT { cout << $1; } { $$ = strdup("float");}

logicop: AND { cout << "&& ";}
         | OR { cout << "|| ";}

declaration: INT_TYPE { cout << "int " } VARIABLE { cout << $3 } SEMICOLON { cout << ";" << endl;}
          { 
            if(getExist($3))
            {
              yyerror("Variable already exists");
              //exit(1);
            }
            else
            {
              symbol_table[$3] = "int";
            }
          }
          | FLOAT_TYPE { cout << "float " } VARIABLE { cout << $3 } SEMICOLON { cout << ";" << endl;}
          { 
            if(getExist($3))
            {
              yyerror("Variable already exists");
              //exit(1);
            }
            else
            {
              symbol_table[$3] = "float";
            }
          }

op: PLUS { cout << "+ ";}
    | MINUS { cout << "- ";}
    | MOD { cout << "% ";}
    | MULTIPLY { cout << "* ";}
    | DIVIDE { cout << "/ ";}


    

expression: vl op VARIABLE
{
    if (!getExist($3)) {
        yyerror("Variable does not exist");
        //exit(1);
    }
    string t1 = $1;
    string t2 = getType($3);

    if (t1 != t2) {
        yyerror("Type missmatch");
        //exit(1);
    }
    cout << $3;

    $$ = strdup(t1.c_str());
}
| vl op number
{
    string t1 = $1;
    string t2 = $3;

    if (t1 != t2) {
        yyerror("Type missmatch");
        //exit(1);
    }

    $$ = strdup(t1.c_str());
}
| number
{
    $$ = $1;
}
| VARIABLE
{
    if (!getExist($1)) {
        yyerror("Variable does not exist");
        //exit(1);
    }

    cout << $1;
    $$ = strdup(getType($1).c_str());
}


operation: VARIABLE { cout << $1 << " "; } ASSIGN { cout << "= "; } expression SEMICOLON { cout << ";" << endl; }
{
    if (!getExist($1)) {
         yyerror("Variable does not exist");
        //exit(1);
    }

    string t1 = getType($1);
    string t2 = $5;
    if(t1 == "int" && t2 == "float")
    {
       yyerror("Type missmatch");
    }

}
;



ifpart : IF { cout << "if"} LPAREN { cout << "("} expr RPAREN { cout << ")" << endl; } LBRACE { cout << "{" << endl; } block RBRACE { cout << "}" << endl;} ELSE { cout << "else" << endl; } LBRACE {cout << "{" << endl; } block RBRACE { cout << "}" << endl; }
     | IF error {yyerrok; yyerror("not if like");}
;


block: SEMICOLON { cout << ";" << endl; }
   | declaration block
   | ifpart block
   | whilepart block
   | operation block
   | outputpart block
   | declaration
   | ifpart
   | whilepart
   | operation
   | outputpart
;

outputpart: OUTPUT VARIABLE SEMICOLON
{
  cout << "cout << " << $2 << ";" << endl;
}
      | OUTPUT { cout << "cout << "; } number SEMICOLON { cout << ";" << endl; }

hasonlitoop: NOT_EQUAL { cout << "!= "; }
           | EQUAL { cout << "== "; }
           | LESS { cout << "< "; }
           | GREATER { cout << "> "; }

element :  hasonlitoop VARIABLE 
      { 
        cout << $2 << " "; 
        if(!getExist($2))
        {
            yyerror("Variable does not exist");
            //exit(1);
        }
        string s = getType($2);
        $$ = strdup(s.c_str());
      }
     | hasonlitoop number
     {
       $$ = $2;
     }


vl: VARIABLE
{
  cout << $1 << " "; 
        if(!getExist($1))
        {
             yyerror("Variable does not exist");
            //exit(1);
        }
        string s = getType($1);
        $$ = strdup(s.c_str());
}

expr: vl element
{
            string a = $1;
            string b = $2;
            if(a == "undefined" || b == "undefined")
            {
                yyerror("Wrong types");
               //exit(1);
            }
            if(a != b)
            {
              yyerror("Type missmatch");
              //exit(1);
            }
       }

  | vl element logicop expr
  {
            string a = $1;
            string b = $2;
            if(a == "undefined" || b == "undefined")
            {
               yyerror("Wrong types");
               //exit(1);
            }
            if(a != b)
            {
              yyerror("Type missmatch");
              //exit(1);
            }
    }

whilepart: WHILE { cout << "while"; }LPAREN { cout << "("} expr RPAREN { cout << ")" << endl << "{" << endl; } LBRACE block RBRACE { cout << "}" << endl;}
           | WHILE error LPAREN expr RPAREN LBRACE block RBRACE {yyerror("not while like");}

%%

int main() {
    yyparse();
}

void yyerror(string s) {
  cout << "row: " << yylineno << ", column: " << col << ", error: " << s << endl;
}
