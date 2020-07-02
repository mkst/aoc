#include <stdio.h>
#include <string.h>
#include <openssl/evp.h>

#include "k.h"

// gcc aoc.c -shared -lcrypto -fPIC -o aoc.so

// md5C:*"../src/aoc.so"2:`md5!1
// md5:{[x] `c md5C x}
K md5(const S x)
{
  unsigned int MD5_HASH_LENGTH = 16;
  unsigned char digest[MD5_HASH_LENGTH];

  EVP_MD_CTX *mdctx = EVP_MD_CTX_new();
  // EVP_MD_CTX *mdctx = EVP_MD_CTX_create();
  EVP_MD_CTX_init(mdctx);
  EVP_DigestInit(mdctx, EVP_md5());
  EVP_DigestUpdate(mdctx, x, strlen(x));
  EVP_DigestFinal(mdctx, digest, &MD5_HASH_LENGTH);
  EVP_MD_CTX_free(mdctx);
  // EVP_MD_CTX_destroy(mdctx);

  K d = k((S)'I', MD5_HASH_LENGTH);
  for (U i = 0; i < MD5_HASH_LENGTH; i++)
  {
    ((I*)d)[i] = (unsigned char) digest[i];
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
