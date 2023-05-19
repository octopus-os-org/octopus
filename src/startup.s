.global RawResetHandler
.global _vector_table

.section .text.vector_table
_vector_table:
    .word  _stack_end /*_estack */
    .word  RawResetHandler+1 /*RawResetHandler */
    .word  0 /*NMI_Handler */
    .word  0 /*HardFault_Handler */
    .word  0 /*MemManage_Handler */
    .word  0 /*BusFault_Handler */
    .word  0 /*UsageFault_Handler */
    .word  0 /*0 */
    .word  0 /*0 */
    .word  0 /*0 */
    .word  0 /*0 */
    .word  0 /*SVC_Handler */
    .word  0 /*DebugMon_Handler */
    .word  0 /*0 */
    .word  0 /*PendSV_Handler */
    .word  0 /*SysTick_Handler */
    
    /* External Interrupts */
    .word     0       /* Window WatchDog              */                                        
    .word     0       /* PVD through EXTI Line detection */                        
    .word     0       /* Tamper and TimeStamps through the EXTI line */            
    .word     0       /* RTC Wakeup through the EXTI line */                      
    .word     0       /* FLASH                        */                                          
    .word     0       /* RCC                          */                                            
    .word     0       /* EXTI Line0                   */                        
    .word     0       /* EXTI Line1                   */                          
    .word     0       /* EXTI Line2                   */                          
    .word     0       /* EXTI Line3                   */                          
    .word     0       /* EXTI Line4                   */                          
    .word     0       /* DMA1 Stream 0                */                  
    .word     0       /* DMA1 Stream 1                */                   
    .word     0       /* DMA1 Stream 2                */                   
    .word     0       /* DMA1 Stream 3                */                   
    .word     0       /* DMA1 Stream 4                */                   
    .word     0       /* DMA1 Stream 5                */                   
    .word     0       /* DMA1 Stream 6                */                   
    .word     0       /* ADC1, ADC2 and ADC3s         */                   
    .word     0       /* CAN1 TX                      */                         
    .word     0       /* CAN1 RX0                     */                          
    .word     0       /* CAN1 RX1                     */                          
    .word     0       /* CAN1 SCE                     */                          
    .word     0       /* External Line[9:5]s          */                          
    .word     0       /* TIM1 Break and TIM9          */         
    .word     0       /* TIM1 Update and TIM10        */         
    .word     0       /* TIM1 Trigger and Commutation and TIM11 */
    .word     0       /* TIM1 Capture Compare         */                          
    .word     0       /* TIM2                         */                   
    .word     0       /* TIM3                         */                   
    .word     0       /* TIM4                         */                   
    .word     0       /* I2C1 Event                   */                          
    .word     0       /* I2C1 Error                   */                          
    .word     0       /* I2C2 Event                   */                          
    .word     0       /* I2C2 Error                   */                            
    .word     0       /* SPI1                         */                   
    .word     0       /* SPI2                         */                   
    .word     0       /* USART1                       */                   
    .word     0       /* USART2                       */                   
    .word     0       /* USART3                       */                   
    .word     0       /* External Line[15:10]s        */                          
    .word     0       /* RTC Alarm (A and B) through EXTI Line */                 
    .word     0       /* USB OTG FS Wakeup through EXTI line */                       
    .word     0       /* TIM8 Break and TIM12         */         
    .word     0       /* TIM8 Update and TIM13        */         
    .word     0       /* TIM8 Trigger and Commutation and TIM14 */
    .word     0       /* TIM8 Capture Compare         */                          
    .word     0       /* DMA1 Stream7                 */                          
    .word     0       /* FMC                         */                   
    .word     0       /* SDIO                         */                   
    .word     0       /* TIM5                         */                   
    .word     0       /* SPI3                         */                   
    .word     0       /* UART4                        */                   
    .word     0       /* UART5                        */                   
    .word     0       /* TIM6 and DAC1&2 underrun errors */                   
    .word     0       /* TIM7                         */
    .word     0       /* DMA2 Stream 0                */                   
    .word     0       /* DMA2 Stream 1                */                   
    .word     0       /* DMA2 Stream 2                */                   
    .word     0       /* DMA2 Stream 3                */                   
    .word     0       /* DMA2 Stream 4                */                   
    .word     0       /* Ethernet                     */                   
    .word     0       /* Ethernet Wakeup through EXTI line */                     
    .word     0       /* CAN2 TX                      */                          
    .word     0       /* CAN2 RX0                     */                          
    .word     0       /* CAN2 RX1                     */                          
    .word     0       /* CAN2 SCE                     */                          
    .word     0       /* USB OTG FS                   */                   
    .word     0       /* DMA2 Stream 5                */                   
    .word     0       /* DMA2 Stream 6                */                   
    .word     0       /* DMA2 Stream 7                */                   
    .word     0       /* USART6                       */                    
    .word     0       /* I2C3 event                   */                          
    .word     0       /* I2C3 error                   */                          
    .word     0       /* USB OTG HS End Point 1 Out   */                   
    .word     0       /* USB OTG HS End Point 1 In    */                   
    .word     0       /* USB OTG HS Wakeup through EXTI */                         
    .word     0       /* USB OTG HS                   */                   
    .word     0       /* DCMI                         */                   
    .word     0       /* Reserved                     */                   
    .word     0       /* Hash and Rng                 */
    .word     0       /* FPU                          */
    .word     0       /* UART7                        */      
    .word     0       /* UART8                        */
    .word     0       /* SPI4                         */
    .word     0       /* SPI5 						  */
    .word     0       /* SPI6						  */
    .word     0       /* SAI1						  */
    .word     0       /* LTDC_IRQHandler			  */
    .word     0       /* LTDC_ER_IRQHandler			  */
    .word     0       /* DMA2D                        */

.section .text
RawResetHandler:
    ldr sp, =_stack_end       /* set stack pointer */

/* Zero fill the bss segment. */
@     ldr r2, =_bss_start
@     ldr r4, =_bss_end
@     movs r3, #0
@     b LoopFillZerobss
@ FillZerobss:
@     str  r3, [r2]
@     adds r2, r2, #4
@ LoopFillZerobss:
@     cmp r2, r4
@     bcc FillZerobss

/* call  */
    bl resetHandler
    b .



