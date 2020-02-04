#include <iostream>
#include "../parser/parser.hpp"

int main (int argc, char* argv[]) {
    std::cout << "Welcome to Simple Calculator!\n" << std::endl;
    int res;
    yyparse(&res);
    printf("Result: %d\n", res);
    return 0;
}
