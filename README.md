# MinilibC

- **Binary Name:** libasm.so
- **Language:** x86-64 Assembly
- **Compilation:** via Makefile, including re, clean, and fclean rules

## Project Description

The objective of this project is to create a dynamic ELF library, `libasm.so`, to replace (to a certain extent) the standard C library. This library allows you to implement your own versions of selected functions, providing a form of weak binding.

### LD_PRELOAD Warning

Copying code without understanding is discouraged. We encourage you to commit broken code over copying code you don't comprehend. An approximate understanding is expected as proof of your own work.

## Implemented Functions

The following functions are to be implemented in your MinilibC:

- `strlen`
- `strchr`
- `strrchr`
- `memset`
- `memcpy`
- `strcmp`
- `memmove`
- `strncmp`
- `strcasecmp`
- `strstr`
- `strpbrk`
- `strcspn`

Refer to the respective man pages of these functions for behavior specifications. Ensure adherence to these specifications.

## Bonus Points

Consider implementing the following for potential bonus points:

- Additional interesting functions: `ffs`, `syscall`, `strfry`, `index`, `rindex`, `strtok`, `memfrob`, etc.
- Additional architectures (32-bit x86 or ARM, for example).
- Any other useful functionalities you can think of.

## Compilation and Delivery

Compile the project using the provided Makefile, which includes rules for `make`, `make re`, `make clean`, and `make fclean`. Ensure that the totality of your source files, excluding unnecessary files (binary, temp files, obj files, etc.), is included in your delivery.
