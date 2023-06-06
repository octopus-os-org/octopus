.global RawResetHandler
.global InterruptHandler

.extern PendSV_Handler
.extern _stack_end
.extern resetHandler

.equ _intHandler, InterruptHandler
.equ _resetHandler, RawResetHandler

.section .vector_table,"a",%progbits
.type  _vector_table, %object
_vector_table:
    .word  _stack_end /*_estack */
    .word  _resetHandler /*RawResetHandler */
    .word  _intHandler /*NMI_Handler */
    .word  _intHandler /*HardFault_Handler */
    .word  _intHandler /*MemManage_Handler */
    .word  _intHandler /*BusFault_Handler */
    .word  _intHandler /*UsageFault_Handler */
    .word  _intHandler /*0 */
    .word  _intHandler /*0 */
    .word  _intHandler /*0 */
    .word  _intHandler /*0 */
    .word  _intHandler /*SVC_Handler */
    .word  _intHandler /*DebugMon_Handler */
    .word  _intHandler /*0 */
    .word  PendSV_Handler /*PendSV_Handler */
    .word  _intHandler /*SysTick_Handler */
    
    /* External Interrupts */
    .word  _intHandler    /* Window WatchDog              */                                        
    .word  _intHandler    /* PVD through EXTI Line detection */                        
    .word  _intHandler    /* Tamper and TimeStamps through the EXTI line */            
    .word  _intHandler    /* RTC Wakeup through the EXTI line */                      
    .word  _intHandler    /* FLASH                        */                                          
    .word  _intHandler    /* RCC                          */                                            
    .word  _intHandler    /* EXTI Line0                   */                        
    .word  _intHandler    /* EXTI Line1                   */                          
    .word  _intHandler    /* EXTI Line2                   */                          
    .word  _intHandler    /* EXTI Line3                   */                          
    .word  _intHandler    /* EXTI Line4                   */                          
    .word  _intHandler    /* DMA1 Stream 0                */                  
    .word  _intHandler    /* DMA1 Stream 1                */                   
    .word  _intHandler    /* DMA1 Stream 2                */                   
    .word  _intHandler    /* DMA1 Stream 3                */                   
    .word  _intHandler    /* DMA1 Stream 4                */                   
    .word  _intHandler    /* DMA1 Stream 5                */                   
    .word  _intHandler    /* DMA1 Stream 6                */                   
    .word  _intHandler    /* ADC1, ADC2 and ADC3s         */                   
    .word  _intHandler    /* CAN1 TX                      */                         
    .word  _intHandler    /* CAN1 RX0                     */                          
    .word  _intHandler    /* CAN1 RX1                     */                          
    .word  _intHandler    /* CAN1 SCE                     */                          
    .word  _intHandler    /* External Line[9:5]s          */                          
    .word  _intHandler    /* TIM1 Break and TIM9          */         
    .word  _intHandler    /* TIM1 Update and TIM10        */         
    .word  _intHandler    /* TIM1 Trigger and Commutation and TIM11 */
    .word  _intHandler    /* TIM1 Capture Compare         */                          
    .word  _intHandler    /* TIM2                         */                   
    .word  _intHandler    /* TIM3                         */                   
    .word  _intHandler    /* TIM4                         */                   
    .word  _intHandler    /* I2C1 Event                   */                          
    .word  _intHandler    /* I2C1 Error                   */                          
    .word  _intHandler    /* I2C2 Event                   */                          
    .word  _intHandler    /* I2C2 Error                   */                            
    .word  _intHandler    /* SPI1                         */                   
    .word  _intHandler    /* SPI2                         */                   
    .word  _intHandler    /* USART1                       */                   
    .word  _intHandler    /* USART2                       */                   
    .word  _intHandler    /* USART3                       */                   
    .word  _intHandler    /* External Line[15:10]s        */                          
    .word  _intHandler    /* RTC Alarm (A and B) through EXTI Line */                 
    .word  _intHandler    /* USB OTG FS Wakeup through EXTI line */                       
    .word  _intHandler    /* TIM8 Break and TIM12         */         
    .word  _intHandler    /* TIM8 Update and TIM13        */         
    .word  _intHandler    /* TIM8 Trigger and Commutation and TIM14 */
    .word  _intHandler    /* TIM8 Capture Compare         */                          
    .word  _intHandler    /* DMA1 Stream7                 */                          
    .word  _intHandler    /* FSMC                         */                   
    .word  _intHandler    /* SDIO                         */                   
    .word  _intHandler    /* TIM5                         */                   
    .word  _intHandler    /* SPI3                         */                   
    .word  _intHandler    /* UART4                        */                   
    .word  _intHandler    /* UART5                        */                   
    .word  _intHandler    /* TIM6 and DAC1&2 underrun errors */                   
    .word  _intHandler    /* TIM7                         */
    .word  _intHandler    /* DMA2 Stream 0                */                   
    .word  _intHandler    /* DMA2 Stream 1                */                   
    .word  _intHandler    /* DMA2 Stream 2                */                   
    .word  _intHandler    /* DMA2 Stream 3                */                   
    .word  _intHandler    /* DMA2 Stream 4                */                   
    .word  _intHandler    /* Ethernet                     */                   
    .word  _intHandler    /* Ethernet Wakeup through EXTI line */                     
    .word  _intHandler    /* CAN2 TX                      */                          
    .word  _intHandler    /* CAN2 RX0                     */                          
    .word  _intHandler    /* CAN2 RX1                     */                          
    .word  _intHandler    /* CAN2 SCE                     */                          
    .word  _intHandler    /* USB OTG FS                   */                   
    .word  _intHandler    /* DMA2 Stream 5                */                   
    .word  _intHandler    /* DMA2 Stream 6                */                   
    .word  _intHandler    /* DMA2 Stream 7                */                   
    .word  _intHandler    /* USART6                       */                    
    .word  _intHandler    /* I2C3 event                   */                          
    .word  _intHandler    /* I2C3 error                   */                          
    .word  _intHandler    /* USB OTG HS End Point 1 Out   */                   
    .word  _intHandler    /* USB OTG HS End Point 1 In    */                   
    .word  _intHandler    /* USB OTG HS Wakeup through EXTI */                         
    .word  _intHandler    /* USB OTG HS                   */                   
    .word  _intHandler    /* DCMI                         */                   
    .word  _intHandler    /* CRYP crypto                  */                   
    .word  _intHandler    /* Hash and Rng                 */
    .word  _intHandler    /* FPU                          */

.section .text
.type  RawResetHandler, %function
RawResetHandler:
  ldr   sp, =_stack_end     /* set stack pointer */
  b resetHandler
