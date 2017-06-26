#ifndef _RC2014_ANSI_H_
#define _RC2014_ANSI_H_

void __LIB__ __FASTCALL__ rc2014_ansi_cmd(unsigned char *cmd);
void __LIB__ rc2014_ansi_cls(void);
void __LIB__ rc2014_ansi_hide_cursor(void);
void __LIB__ rc2014_ansi_show_cursor(void);
void __LIB__ rc2014_ansi_move_cursor(unsigned int row, unsigned int col);
void __LIB__ __FASTCALL__ rc2014_ansi_color(unsigned int col);

#endif
