/*
** EPITECH PROJECT, 2023
** B-ASM-400-BDX-4-1-asmminilibc-edouard.belhomme
** File description:
** test_strchr
*/

#include <criterion/criterion.h>
#include <stdlib.h>
#include <string.h>
#include <dlfcn.h>
#include <stdio.h>
#include <unistd.h>

char * (*my_strchr)(const char *str, char to_find);

void asm_strchr(void)
{
    void *handle = dlopen("./libasm.so", RTLD_LAZY);
    my_strchr = dlsym(handle, "strchr");
}

Test(strchr_a, basic_test, .init = asm_strchr)
{
    char *str = "Hello world";
    char c = 'l';


    cr_assert_eq(my_strchr(str, c), strchr(str, c));

}

Test(strchr_b, basic_test, .init = asm_strchr)
{
    char *str = "Hello world";
    char c = '\0';

    cr_assert_eq(my_strchr(str, c), strchr(str, c));
}

Test(strchr_c, basic_test, .init = asm_strchr)
{
    char *str = "Hello world";
    char c = 'a';

    cr_assert_eq(my_strchr(str, c), strchr(str, c));
}
