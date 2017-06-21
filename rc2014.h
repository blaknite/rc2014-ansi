#ifndef _RC2014_H_
#define _RC2014_H_

// UART Routines
extern unsigned char __LIB__ __FASTCALL__ rc2014_uart_rx_ready();
extern unsigned char __LIB__ __FASTCALL__ rc2014_uart_rx();
extern void __LIB__ __FASTCALL__ rc2014_uart_tx(unsigned char c);

// Print Routines
void rc2014_print(unsigned char *str);

// ANSI Terminal Routines
void rc2014_ansi_cmd(unsigned char *cmd);
void rc2014_ansi_cls(void);
void rc2014_ansi_hide_cursor(void);
void rc2014_ansi_show_cursor(void);
void rc2014_ansi_move_cursor(unsigned int row, unsigned int col);
void rc2014_ansi_color(unsigned int col);

#endif
