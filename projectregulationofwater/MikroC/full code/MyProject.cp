#line 1 "C:/Users/mohamed/Desktop/cao/projectgithub/New folder (2)/MyProject.c"
char output[15];
char i;

sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB2_bit;
sbit LCD_D5 at RB3_bit;
sbit LCD_D6 at RB4_bit;
sbit LCD_D7 at RB5_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB4_bit;
sbit LCD_D7_Direction at TRISB5_bit;


void main(){
char x;
TrisD=0;
PortD=0;
Lcd_Init();
Lcd_Cmd(_Lcd_CURSOR_OFF);
UART1_Init(9600);
Delay_ms(100);
Lcd_out(1,1,"Welcome in ^_^");
Lcd_out(2,1,"Explain UART");
Delay_ms(1000);
LCD_Cmd(_LCD_CLEAR);
 while (1)
 {
 if (UART1_Data_Ready())
 {
 i = UART1_Read();
 if(i=='1'){

 LCD_Cmd(_LCD_CLEAR);
 Lcd_out(2,1,"pompe");
 portd.f0=1;
 portd.f1=0;
 }
 else if(i=='2'){

 LCD_Cmd(_LCD_CLEAR);
 Lcd_out(2,1,"vanne");
 portd.f1=1;
 portd.f0=0;
 }
 else
 {
 portd=0x00;
 if(i=='0'){
 LCD_Cmd(_LCD_CLEAR);
 Lcd_out(2,1,"pump and vanne off");
 portd.f1=0;
 portd.f0=0;
 LCD_Cmd(_LCD_RETURN_HOME);
 goto k;
 }
 LCD_Chr_Cp(i);
 k:
 ;
 }
 }
 }
 }
