#include <stdio.h>
#include <string.h>

#include "rc2014.h"

// Print Routines
void rc2014_print(unsigned char *str) {
  unsigned int i;
  unsigned int len;

  len = strlen(str);

  for ( i = 0; i < len; i++ ) {
    rc2014_uart_tx(str[i]);
  }
}

// ANSI Terminal Routines
void rc2014_ansi_cmd(unsigned char *cmd) {
  rc2014_uart_tx(0x1B);
  rc2014_print("[");
  rc2014_print(cmd);
}

void rc2014_ansi_cls(void) {
  rc2014_ansi_cmd("2J");
}

void rc2014_ansi_hide_cursor(void) {
  rc2014_ansi_cmd("?25l");
}

void rc2014_ansi_show_cursor(void) {
  rc2014_ansi_cmd("?25h");
}

void rc2014_ansi_move_cursor(unsigned int row, unsigned int col) {
  unsigned char cmd[9];

  sprintf(cmd, "%i;%iH", row, col);
  rc2014_ansi_cmd(cmd);
}

void rc2014_ansi_color(unsigned int col) {
  unsigned char cmd[4];

  sprintf(cmd, "%im", col);
  rc2014_ansi_cmd(cmd);
}
