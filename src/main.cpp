#include <iostream>
#include "../parser/parser.hpp"

int main (int argc, char* argv[]) {
    std::cout << "Welcome to Simple Calculator!\n" << std::endl;
    yyparse();
    return 0;
}
