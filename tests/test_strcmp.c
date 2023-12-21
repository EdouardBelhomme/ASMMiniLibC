/*
** EPITECH PROJECT, 2023
** B-ASM-400-BDX-4-1-asmminilibc-edouard.belhomme
** File description:
** test_strcmp
*/

#include <criterion/criterion.h>
#include <stdlib.h>
#include <string.h>
#include <dlfcn.h>
#include <stdio.h>
#include <unistd.h>

int * (*my_strcmp) (const char *s1, const char *s2);

void asm_strcmp(void)
{
    void *handle = dlopen("./libasm.so", RTLD_LAZY);
    my_strcmp = dlsym(handle, "strcmp");
}

Test(strcmp_a, basic_test, .init = asm_strcmp)
{
    char *str1 = "Hello world";
    char *str2 = "Hello world";

    cr_assert_eq(my_strcmp(str1, str2), strcmp(str1, str2));
}

Test(strcmp_b, basic_test, .init = asm_strcmp)
{
    char *str1 = "Hello world";
    char *str2 = "Hello worl";

    cr_assert_eq(my_strcmp(str1, str2), strcmp(str1, str2));
}