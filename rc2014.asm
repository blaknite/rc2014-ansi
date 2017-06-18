;--------------------------------------------------------------------
; RC2014 UART Routines
;
; Code by Grant Colegate 2017
;
; See http://rc2014.co.uk for info on the RC2014 homebrew computer.
;--------------------------------------------------------------------

MODULE rc2014

SECTION code_user


; Read a character from the UART.
; Returns the received character in HL.
public rc2014_uart_rx
rc2014_uart_rx:
            rst $10
            ld l, a
            ret


; Transmit a character to the UART.
; Transmits the character in L.
public rc2014_uart_tx
rc2014_uart_tx:
            ld a, l
            rst $08
            ret
