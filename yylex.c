#include <stdio.h>
#include "y.tab.h"

extern FILE* yyin;
extern int line;

int yyerror(symbol) {
	if (symbol == EOF) { printf("yyerror %d", symbol); }

	print_error("Unexpected lexical error", line);
}

int yylex() {

	int symbol = getc(yyin);
	if (symbol == EOF && line == 1) { printf("File is empty\n"); exit(0); }

	while (symbol == ' ') symbol = getc(yyin);

	// check comments
	if (symbol == '#') {
		symbol = getc(yyin);

		while (symbol != '\n') {
			if (symbol == EOF) exit(0);
			symbol = getc(yyin);
		}
	}

	if (ispunct(symbol)) {

		if (symbol == '=' || symbol == '\\' || symbol == '.' || symbol == '*' || symbol == '$' || symbol == ':' || symbol == '-'
		    || symbol == '?' || symbol == '|' || symbol == '{' || symbol == '}' || symbol == '(' || symbol == ')' || symbol == ';') { 
			return symbol;
		}
		else { 
			printf("Lexical error: invalid character '%c' in line %d\n", symbol, line);
			exit(0);
		}
	}
	else if (isdigit(symbol)) { yylval = symbol - '0'; return DIGIT; }
	else if (islower(symbol)) { yylval = symbol - 'a'; return LETTER; }
	else if (isupper(symbol)) { yylval = symbol - 'A'; return BIG_LETTER; }
	else if (isspace(symbol)) { return symbol; }
	else { return symbol; }
}