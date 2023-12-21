/*
** EPITECH PROJECT, 2023
** B-ASM-400-BDX-4-1-asmminilibc-edouard.belhomme
** File description:
** test_strlen
*/

#include <criterion/criterion.h>
#include <stdlib.h>
#include <string.h>
#include <dlfcn.h>
#include <stdio.h>

Test(strlen_0, strlen_0)
{
    int (*strlen)(char *);
    void *handle = dlopen("./libasm.so", RTLD_LAZY);
    char *test = "";

    strlen = dlsym(handle, "strlen");
    int r_strlen = strlen(test);
    cr_assert_eq(r_strlen, 0);
}

Test(strlen, strlen)
{
    int (*strlen)(char *);
    void *handle = dlopen("./libasm.so", RTLD_LAZY);
    char *test = "Hello world!";

    strlen = dlsym(handle, "strlen");
    int r_strlen = strlen(test);
    cr_assert_eq(r_strlen, 12);
}