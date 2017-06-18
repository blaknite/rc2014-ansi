;--------------------------------------------------------------------
; RC2014 UART Routines
;
; Code by Grant Colegate 2017
;
; Adapted from code by Filippo Bergamasco 2016
;
; See http://rc2014.co.uk for info on the RC2014 homebrew computer.
;--------------------------------------------------------------------

MODULE rc2014

SECTION code_user


; Polls the UART receive buffer status.
; Returns the result in L.
; 0: waiting for rx
; 1: rx ready
public rc2014_uart_rx_ready
rc2014_uart_rx_ready:
            ld l, 0
            in a, ($80)
            bit 0, a
            ret z
            ld l, 1
            ret


; Read a character from the UART.
; Returns the received character in HL.
public rc2014_uart_rx
rc2014_uart_rx:
            push af
rxwait:     call rc2014_uart_rx_ready
            jr z, rxwait
            in a, ($81)
            ld h, 0
            ld l, a
            pop af
            ret


; Polls the UART transmit buffer status.
; Returns the result in L.
; 0: waiting for tx
; 1: tx ready
public rc2014_uart_tx_ready
rc2014_uart_tx_ready:
            ld l, 1
            in a, ($80)
            bit 1, a
            ret z
            ld l, 0
            ret


; Transmit a character to the UART.
; Transmits the character in L.
public rc2014_uart_tx
rc2014_uart_tx:
            ld a, l
            push af
txwait:     call rc2014_uart_tx_ready
            jr z, txwait
            pop af
            out ($81), a
            ret
