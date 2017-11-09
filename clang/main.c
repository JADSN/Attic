/* 
#include "foobar.c"
*/
#include "foobar.h"
#include <stdio.h> // a libc vai definir essas funções

int main() {
    printf("%d\n", foo(2)); // 4
    printf("%d\n", foo(2)); // 6
    //baz = 3;
    printf("%d\n", foo(2)); // 8
}
