SipHash in C
====

A pure C implementation of [SipHash-2-4](https://131002.net/siphash/),
a fast short-input
[PRF](https://en.wikipedia.org/wiki/Pseudorandom_function) with a
128-bit key and 64-bit output.

Extract from the description:

    SipHash is a family of pseudorandom functions (a.k.a. keyed hash
    functions) optimized for speed on short messages.

    Target applications include network traffic authentication and defense
    against hash-flooding DoS attacks.

    SipHash is secure, fast, and simple (for real):
    * SipHash is simpler and faster than previous cryptographic algorithms
      (e.g. MACs based on universal hashing)
    * SipHash is competitive in performance with insecure
      non-cryptographic algorithms (e.g. MurmurHash)
    * We propose that hash tables switch to SipHash as a hash
      function. Users of SipHash already include OpenDNS, Perl 5, Ruby, or
      Rust.


Introductory blog post: https://idea.popcount.org/2013-01-24-siphash/

installation
---

Copy `csiphash.c` to your code directory and add the declaration
somewhere:

```c
uint64_t siphash24(const void *src,
                   unsigned long src_sz,
                   const char k[16]);
```


usage
---

Shortest program:

```c
#include <stdio.h>
#include <stdint.h>
#include <string.h>

uint64_t siphash24(const void *src,
                   unsigned long src_sz,
                   const char key[16]);

int main() {
    char key[16] = {0,1,2,3,4,5,6,7,8,9,0xa,0xb,0xc,0xd,0xe,0xf};
    char *pt = "hello world!";
    uint64_t hash = siphash24(pt, strlen(pt), key);
    printf("plaintext=%s hash=%llu\n", pt, hash);
    return 0;
}
```

testing
---

Type `make`:

    $ make
    64 tests passed in 0.008ms, 125ns per test

license
----

This code is released under the MIT License, the full text of which can be found is in the header of [`csiphash.c`](https://github.com/majek/csiphash/blob/master/csiphash.c).
