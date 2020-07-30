#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <openssl/md5.h>

#include "k.h"

// gcc aoc.c -shared -lcrypto -fPIC -o aoc.so -std=c99

// md5C:*"../src/aoc.so"2:`md5!1
// md5:{[x] `c md5C x}
K md5(const S x)
{
  unsigned char digest[16];
  MD5((const unsigned char*)x, strlen(x), digest);
  K d = k((S)'I', 16);
  for (U i = 0; i < 16; i++)
  {
    ((I*)d)[i] = digest[i];
  }
  return d;
}

//ssC:*"../src/aoc.so"2:`ss!2
//ss:{[x;y] (),ssC[x,0x0;y,0x0]}
K ss(const S x, const S y)
{
  I lx = strlen(x);
  I ly = strlen(y);

  if (lx == 0 || ly == 0)
  {
    return k((S)'I', 0);
  }

  const char *ptr = x;
  const char *p_idx = ptr;

  I *tmp = (I*) malloc((lx / ly) * sizeof(I));
  I fnd = 0;

  while ((ptr = strstr(ptr, y)) != NULL)
  {
    ((I*)tmp)[fnd++] = ptr - p_idx;
    ptr = ptr + ly * sizeof(char);
  }
  K r = k((S)'I', fnd);
  for (int i = 0; i < fnd; i++)
  {
    ((I*)r)[i] = tmp[i];
  }
  free(tmp);

  return r;
}
