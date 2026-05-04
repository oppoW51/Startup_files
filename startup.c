#include <stdint.h>

extern int main(void);
extern uint32_t _estack;
extern uint32_t _sdata;
extern uint32_t _edata;
extern uint32_t _sidata;
extern uint32_t _sbss;
extern uint32_t _ebss;
void Reset_handle(void);

__attribute__((section(".vectors")))
const void* vectors[] = {
    &_estack,
    Reset_handle
};

void Reset_handle(void){
    uint32_t *src = &_sidata;
    uint32_t *dest = &_sdata;
    
    // copy data to RAM
    while (dest < &_edata)
        *dest++ = *src++;
    
    // set not initialized data
    dest = &_sbss;
    while (dest < &_ebss)
        *dest++ = 0;
    
    // call your code
    main();
    while(1);
}
