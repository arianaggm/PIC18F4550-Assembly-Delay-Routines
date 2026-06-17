; TODO INSERT CONFIG CODE HERE USING CONFIG BITS GENERATOR

#define CONT1 0x00
#define CONT2 0x01
#define CONT3 0x02
#define CONT4 0x04
    
    
RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

; TODO ADD INTERRUPTS HERE IF USED

MAIN_PROG CODE                      ; let linker place main program

START ;cuando es un 1MHz, 250kHz 4 es un 1MHz
    CALL delay_100us
;    CALL delay_250us
;    CALL delay_3ms ;vale 2 inst
    ;4 MHz
    CALL delay_300us
    ;1 MHz
;    CALL delay_500us
;    CALL delay_100ms
;    CALL delay_0.75s
    
    GOTO $
    
;;;;;;;;;;;FUNCIONES DE 8MHz;;;;;;;;;;;;;;
delay_100us ;200 instructions at 8MHz - Oscillador 2MHz n = 100us(8MHz)/4 = 100
   MOVLW .65 ;
   MOVWF CONT1
REP1
    DECFSZ CONT1
    BRA REP1
    RETURN

delay_250us ;500 inst 
    MOVLW .165
    MOVWF CONT1
REP2
    DECFSZ CONT1
    BRA REP2
    RETURN
    
delay_3ms ;6000 instruciones a 8MHz (3ms)(8MHz)/4 ;vale 2 inst
    MOVLW .12 ;ciclo principal 6000/12 (2 de 250)
    MOVWF CONT1
CYCLE1
    MOVLW .165 ;ciclo interno 500/3 -1 
    MOVWF CONT2
CYCLE2
    DECFSZ CONT2 ;vale 1 inst
    BRA CYCLE2 ;vale 2 inst
    DECFSZ CONT1
    BRA CYCLE1
    
    NOP ;1 inst 
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    RETURN ;vale 2 inst

    
 ;;;;;;;;;;;FUNCION DE 4MHz;;;;;;;;;;;;;;
delay_300us ;vale 2 inst (300us)(4MHz)/4 = 300
   MOVLW .97 ;300/3 = 100
   MOVWF CONT1
REP3
    DECFSZ CONT1
    BRA REP3
    NOP
    NOP
    RETURN
    
 ;;;;;;;;;;;FUNCION DE 1MHz;;;;;;;;;;;;;;
delay_500us ;vale 2 inst (500us)(1MHz)/4 = 125
   MOVLW .39 ;125/3 = 42
   MOVWF CONT1
REP4
    DECFSZ CONT1
    BRA REP4
    NOP
    RETURN

delay_100ms ;250000 instruciones a 1MHz (100ms)(1MHz)/4 ;vale 2 inst
    MOVLW .50 ;ciclo principal 25000/50 (2 de 250)
    MOVWF CONT1
CYCLE3
    MOVLW .165 ;ciclo interno 500/3 
    MOVWF CONT2
CYCLE4
    DECFSZ CONT2 ;vale 1 inst
    BRA CYCLE4 ;vale 2 inst
    DECFSZ CONT1
    BRA CYCLE3
    
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP    
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    
    RETURN ;vale 2 inst
    
delay_0.75s ;187500 instruciones a 1MHz (75s)(1MHz)/4 ;vale 2 inst
    MOVLW .250 ;ciclo principal 187500/37500 = 500 (2 de 250)
    MOVWF CONT1
CYCLE5
    MOVLW .248 ;ciclo interno
    MOVWF CONT2
CYCLE6
    DECFSZ CONT2 ;vale 1 inst - decrementa al contador 2 
    BRA CYCLE6 ;vale 2 inst - sino se regresa 
    DECFSZ CONT1 ;- ;decrementa al cont 1 y si no da 0, regresa al ciclo 
    BRA CYCLE5 ;- ;sino se regresa al ciclo 5

    MOVLW .164 ;ciclo principal 187500/37500 = 500 (2 de 250)
    MOVWF CONT1
CYCLE7
    DECFSZ CONT1
    BRA CYCLE7
    
   NOP
   NOP
    RETURN 
    END
