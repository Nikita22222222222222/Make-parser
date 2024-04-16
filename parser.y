%{
#include <stdio.h> 
#include <string.h>
#include <math.h>
#include <ctype.h>
#include <stdbool.h>

enum error_type {

};

void print_error(const char* text, int line) {
	printf("%s in line %d\n", text, line);
	exit(0);
}

void error_list(enum error_type error) {

	switch (error) {
	case DOUBLE_CHARACTER:
		print_error("Syntax error: Double character", line);

	case EMPTY_OPERATOR:
		print_error("Syntax error: Operator doesn't exist", line);
	
	case NEGATIVE_DEGREE:
		print_error("Syntax error: A degree can only be expressed by a positive number", line);
	
	case POLYNOM_DEGREE:
		print_error("Syntax error: The degree shouldn't be in the form of a polynomial", line);

	case INCORRECT_ASSIGNMENT:
		print_error("Syntax error: Assigning values to a non-variable polynomial", line);

	case EMPTY_OUTPUT:
		print_error("Syntax error: Missing values for output", line);
	
	case DIVISION_BY_ZERO:
		print_error("Semantic error: Division by 0", line);

	case NON_INTEGER_DIVISION:
		print_error("Semantic error: It's impossible to divide integer", line);
	
	case DIVISION_ERR:
		print_error("Semantic error: The dividible is less than the divisor", line);
	
	case NOT_INITIALIZED:
		print_error("Semantic error: The variable hasn't been initialized", line);
	
	case MAX_DEGREE:
		print_error("Semantic error: Maximum polynomial degree < 256", line);
	
	case MULTIPLICATION_VARIABLE:  
		print_error("Semantic error: multiplicationplication of polynomials from different variables", line);
	case ZERO_DEGREE:
		print_error("Semantic error: uncertainty 0^0", line);
	default:
		break;
	}
}

%}

%start starter

%token DIGIT LETTER
%left '+' '-'
%left '*' '/'
%right '^'
%%

starter: begin 
	| begin enter starter
	| enter starter
	| enter 
;

enter: '\n' { line++; }
;

begin: 

;

init: 

;

main: 

;  

word: LETTER {}
	| word LETTER {}
;
