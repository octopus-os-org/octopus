.global _startup

.extern InterruptHandler

.extern PendSV_Handler
.extern SysTickIrqHandler
.extern _stack_end
.extern resetHandler

@ .equ _intHandler, InterruptHandler
@ .equ _resetHandler, _startup

.thumb_set _resetHandler,_startup
.thumb_set _intHandler,InterruptHandler

.section .vector_table,"a",%progbits
.type  _vector_table, %object
_vector_table:
    .word  _stack_end /*_estack */
    .word  _resetHandler /*_startup */
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
    .word  SysTickIrqHandler /*SysTick_Handler */
    
    /* External Interrupts */
	  .word	 _intHandler /* WWDG_IRQHandler */
	  .word	 _intHandler /* PVD_PVM_IRQHandler */
	  .word	 _intHandler /* TAMP_STAMP_IRQHandler */
	  .word	 _intHandler /* RTC_WKUP_IRQHandler */
	  .word	 _intHandler /* FLASH_IRQHandler */
	  .word	 _intHandler /* RCC_IRQHandler */
	  .word	 _intHandler /* EXTI0_IRQHandler */
	  .word	 _intHandler /* EXTI1_IRQHandler */
	  .word	 _intHandler /* EXTI2_IRQHandler */
	  .word	 _intHandler /* EXTI3_IRQHandler */
	  .word	 _intHandler /* EXTI4_IRQHandler */
	  .word	 _intHandler /* DMA1_Channel1_IRQHandler */
	  .word	 _intHandler /* DMA1_Channel2_IRQHandler */
	  .word	 _intHandler /* DMA1_Channel3_IRQHandler */
	  .word	 _intHandler /* DMA1_Channel4_IRQHandler */
	  .word	 _intHandler /* DMA1_Channel5_IRQHandler */
	  .word	 _intHandler /* DMA1_Channel6_IRQHandler */
	  .word	 _intHandler /* DMA1_Channel7_IRQHandler */
	  .word	 _intHandler /* ADC1_2_IRQHandler */
	  .word	 _intHandler /* CAN1_TX_IRQHandler */
	  .word	 _intHandler /* CAN1_RX0_IRQHandler */
	  .word	 _intHandler /* CAN1_RX1_IRQHandler */
	  .word	 _intHandler /* CAN1_SCE_IRQHandler */
	  .word	 _intHandler /* EXTI9_5_IRQHandler */
	  .word	 _intHandler /* TIM1_BRK_TIM15_IRQHandler */
	  .word	 _intHandler /* TIM1_UP_TIM16_IRQHandler */
	  .word	 _intHandler /* TIM1_TRG_COM_TIM17_IRQHandler */
	  .word	 _intHandler /* TIM1_CC_IRQHandler */
	  .word	 _intHandler /* TIM2_IRQHandler */
	  .word	 _intHandler /* TIM3_IRQHandler */
	  .word	 _intHandler /* TIM4_IRQHandler */
	  .word	 _intHandler /* I2C1_EV_IRQHandler */
	  .word	 _intHandler /* I2C1_ER_IRQHandler */
	  .word	 _intHandler /* I2C2_EV_IRQHandler */
	  .word	 _intHandler /* I2C2_ER_IRQHandler */
	  .word	 _intHandler /* SPI1_IRQHandler */
	  .word	 _intHandler /* SPI2_IRQHandler */
	  .word	 _intHandler /* USART1_IRQHandler */
	  .word	 _intHandler /* USART2_IRQHandler */
	  .word	 _intHandler /* USART3_IRQHandler */
	  .word	 _intHandler /* EXTI15_10_IRQHandler */
	  .word	 _intHandler /* RTC_Alarm_IRQHandler */
	  .word	 _intHandler /* DFSDM1_FLT3_IRQHandler */
	  .word	 _intHandler /* TIM8_BRK_IRQHandler */
	  .word	 _intHandler /* TIM8_UP_IRQHandler */
	  .word	 _intHandler /* TIM8_TRG_COM_IRQHandler */
	  .word	 _intHandler /* TIM8_CC_IRQHandler */
	  .word	 _intHandler /* ADC3_IRQHandler */
	  .word	 _intHandler /* FMC_IRQHandler */
	  .word	 _intHandler /* SDMMC1_IRQHandler */
	  .word	 _intHandler /* TIM5_IRQHandler */
	  .word	 _intHandler /* SPI3_IRQHandler */
	  .word	 _intHandler /* UART4_IRQHandler */
	  .word	 _intHandler /* UART5_IRQHandler */
	  .word	 _intHandler /* TIM6_DAC_IRQHandler */
	  .word	 _intHandler /* TIM7_IRQHandler */
	  .word	 _intHandler /* DMA2_Channel1_IRQHandler */
	  .word	 _intHandler /* DMA2_Channel2_IRQHandler */
	  .word	 _intHandler /* DMA2_Channel3_IRQHandler */
	  .word	 _intHandler /* DMA2_Channel4_IRQHandler */
	  .word	 _intHandler /* DMA2_Channel5_IRQHandler */
	  .word	 _intHandler /* DFSDM1_FLT0_IRQHandler */
	  .word	 _intHandler /* DFSDM1_FLT1_IRQHandler */
	  .word	 _intHandler /* DFSDM1_FLT2_IRQHandler */
	  .word	 _intHandler /* COMP_IRQHandler */
	  .word	 _intHandler /* LPTIM1_IRQHandler */
	  .word	 _intHandler /* LPTIM2_IRQHandler */
	  .word	 _intHandler /* OTG_FS_IRQHandler */
	  .word	 _intHandler /* DMA2_Channel6_IRQHandler */
	  .word	 _intHandler /* DMA2_Channel7_IRQHandler */
	  .word	 _intHandler /* LPUART1_IRQHandler */
	  .word	 _intHandler /* QUADSPI_IRQHandler */
	  .word	 _intHandler /* I2C3_EV_IRQHandler */
	  .word	 _intHandler /* I2C3_ER_IRQHandler */
	  .word	 _intHandler /* SAI1_IRQHandler */
	  .word	 _intHandler /* SAI2_IRQHandler */
	  .word	 _intHandler /* SWPMI1_IRQHandler */
	  .word	 _intHandler /* TSC_IRQHandler */
	  .word  _intHandler /* 0 */
	  .word  _intHandler /* 0 */
	  .word	 _intHandler /* RNG_IRQHandler */
	  .word	 _intHandler /* FPU_IRQHandler */

.section .text
.type  _startup, %function
_startup:
  ldr   sp, =_stack_end     /* set stack pointer */
  b resetHandler
