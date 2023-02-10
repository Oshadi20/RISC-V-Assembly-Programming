// C program that computes the factorial of a given non-negative number, n,
// by means of recursive function
#if defined(D_NEXYS_A7)
   #include <bsp_printf.h>
   #include <bsp_mem_map.h>
   #include <bsp_version.h>
#else
   PRE_COMPILED_MSG("no platform was defined")
#endif
#include <psp_api.h>

long factorial(int n){
    if(n==0){
        return 1;
    }else{
        return (n * factorial(n-1));
    }
}

void main(){
    // Initialize Uart 
    uartInit();
    int n = 7;
    long result;
    result = factorial(n);
    printfNexys("Factorial of %d is: %d",n,result);
}
