// C program that computes the factorial of a given non-negative number, n,
// by means of iterative multiplications
#if defined(D_NEXYS_A7)
   #include <bsp_printf.h>
   #include <bsp_mem_map.h>
   #include <bsp_version.h>
#else
   PRE_COMPILED_MSG("no platform was defined")
#endif
#include <psp_api.h>

int main(){
    // Initialize Uart 
    uartInit();
    int i;
    int fact = 1;
    int n = 7;
    for(i=1; i<=n; i++){
        fact = fact*i;
    }
    printfNexys("Factorial of %d is: %d",n,fact);
    return 0;
}
