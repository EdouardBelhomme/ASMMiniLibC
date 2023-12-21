/*
** EPITECH PROJECT, 2023
** B-ASM-400-BDX-4-1-asmminilibc-edouard.belhomme
** File description:
** test_strrchr
*/

#include <criterion/criterion.h>
#include <stdlib.h>
#include <string.h>
#include <dlfcn.h>
#include <stdio.h>
#include <unistd.h>

char * (*my_strrchr)(const char *str, char to_find);

void asm_strrchr(void)
{
    void *handle = dlopen("./libasm.so", RTLD_LAZY);
    my_strrchr = dlsym(handle, "strrchr");
}

Test(strrchr_a, basic_test, .init = asm_strrchr)
{
    char *str = "Hello world";
    char c = 'l';

    cr_assert_eq(my_strrchr(str, c), strrchr(str, c));
}

Test(strrchr_b, basic_test, .init = asm_strrchr)
{
    char *str = "Hello world";
    char c = '\0';

    cr_assert_eq(my_strrchr(str, c), strrchr(str, c));
}

Test(strrchr_c, basic_test, .init = asm_strrchr)
{
    char *str = "Hello world";
    char c = 'a';

    cr_assert_eq(my_strrchr(str, c), strrchr(str, c));
}
