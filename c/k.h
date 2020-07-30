typedef int I;typedef long J;typedef float E;typedef double F;typedef const char*S;

typedef unsigned long K,U;

#define R return
#define P(b,a...) if(b)R({a;});
#define N(n,a...) {I _n=(n),i=-1;while(++i<n){a;}}
#define C(i,a...) case i:a;break;
#define S(i,c,a...) switch(i){c default:a;}

extern K k(S,U);K g(U c,U x){R k((S)c,x);}

#define tx ((U)x>>56)
#define xs (S)(-1UL>>16&(U)x)
#define xj *(J*)xs
#define xf *(F*)xs

#define xn ((I*)x)[-2]
#define Xx ((K*)x)[i]

#define KI 1*8+5
#define KJ 1*8+6
#define KE 5*8+5
#define KF 5*8+6
#define KS 7*8
