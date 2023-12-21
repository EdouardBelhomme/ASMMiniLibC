/*
** EPITECH PROJECT, 2023
** B-ASM-400-BDX-4-1-asmminilibc-edouard.belhomme
** File description:
** test_memmove
*/

#include <criterion/criterion.h>
#include <stdlib.h>
#include <string.h>
#include <dlfcn.h>
#include <stdio.h>
#include <unistd.h>

void * (*my_memmove)(void *dest, const void *src, size_t n);

void asm_memmove(void)
{
    void *handle = dlopen("./libasm.so", RTLD_LAZY);
    my_memmove = dlsym(handle, "memmove");
}

Test(memmove, basic, .init = asm_memmove)
{
    char str[] = "Hello";
    char *str2 = str;

    my_memmove(str2, str2, 5);
    cr_assert_str_eq(str2, str);
}

Test(memmove, basic2, .init = asm_memmove)
{
    char str[] = "Hello";
    char *str2 = str;
    char str3[] = "Hello";
    char *str4 = str;

    my_memmove(str2 + 3, str2, 5);
    memmove(str4 + 3, str4, 5);
    cr_assert_str_eq(str2, str4);
}

Test(memmove, empty_string, .init = asm_memmove)
{
    char str[] = "";
    char *str2 = str;
    char str3[] = "";
    char *str4 = str;

    my_memmove(str2, str2, 0);
    memmove(str4, str4, 0);
    cr_assert_str_eq(str2, str4);
}

Test(memmove, empty_string2, .init = asm_memmove)
{
    char str[] = "";
    char *str2 = str;
    char str3[] = "";
    char *str4 = str;

    my_memmove(str2, str2, 5);
    memmove(str4, str4, 5);
    cr_assert_str_eq(str2, str4);
}

Test(memmove, move_byte, .init = asm_memmove)
{
    char str[] = "Hello";
    char *str2 = str;
    char str3[] = "Hello";
    char *str4 = str;

    my_memmove(str2 + 3, str2, 1);
    memmove(str4 + 7, str4, 1);
    cr_assert_str_eq(str2, str4);
}
