
_main:

;MyProject.c,19 :: 		void main(){
;MyProject.c,21 :: 		TrisD=0;
	CLRF       TRISD+0
;MyProject.c,22 :: 		PortD=0;
	CLRF       PORTD+0
;MyProject.c,23 :: 		Lcd_Init();//Initialize LCD
	CALL       _Lcd_Init+0
;MyProject.c,24 :: 		Lcd_Cmd(_Lcd_CURSOR_OFF); //Cusrsor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,25 :: 		UART1_Init(9600);
	MOVLW      129
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;MyProject.c,26 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;MyProject.c,27 :: 		Lcd_out(1,1,"Welcome in ^_^");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,28 :: 		Lcd_out(2,1,"Explain UART");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,29 :: 		Delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
;MyProject.c,30 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,31 :: 		while (1)
L_main2:
;MyProject.c,33 :: 		if (UART1_Data_Ready())   // if data is received
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
;MyProject.c,35 :: 		i = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _i+0
;MyProject.c,36 :: 		if(i=='1'){
	MOVF       R0+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;MyProject.c,38 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,39 :: 		Lcd_out(2,1,"pompe");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,40 :: 		portd.f0=1;
	BSF        PORTD+0, 0
;MyProject.c,41 :: 		portd.f1=0;                  //write data to lcd
	BCF        PORTD+0, 1
;MyProject.c,42 :: 		}
	GOTO       L_main6
L_main5:
;MyProject.c,43 :: 		else if(i=='2'){
	MOVF       _i+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;MyProject.c,45 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,46 :: 		Lcd_out(2,1,"vanne");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,47 :: 		portd.f1=1;
	BSF        PORTD+0, 1
;MyProject.c,48 :: 		portd.f0=0;                   //write data to lcd
	BCF        PORTD+0, 0
;MyProject.c,49 :: 		}
	GOTO       L_main8
L_main7:
;MyProject.c,52 :: 		portd=0x00;
	CLRF       PORTD+0
;MyProject.c,53 :: 		if(i=='0'){
	MOVF       _i+0, 0
	XORLW      48
	BTFSS      STATUS+0, 2
	GOTO       L_main9
;MyProject.c,54 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,55 :: 		Lcd_out(2,1,"pump and vanne off");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,56 :: 		portd.f1=0;
	BCF        PORTD+0, 1
;MyProject.c,57 :: 		portd.f0=0;
	BCF        PORTD+0, 0
;MyProject.c,58 :: 		LCD_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,59 :: 		goto k;
	GOTO       ___main_k
;MyProject.c,60 :: 		}
L_main9:
;MyProject.c,61 :: 		LCD_Chr_Cp(i);                  //write data to lcd
	MOVF       _i+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;MyProject.c,62 :: 		k:
___main_k:
;MyProject.c,64 :: 		}
L_main8:
L_main6:
;MyProject.c,65 :: 		}
L_main4:
;MyProject.c,66 :: 		}
	GOTO       L_main2
;MyProject.c,67 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
