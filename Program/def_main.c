/* DPTP SYSTEM - WandClock 1.0
 * Email:	don_peter@freemail.hu
 * Dátum:   2014 júl. 9 Szerda
 * Processor: PIC16F684
 * Fórdító:  HI-TECH C for PIC10/12/16
 */

#include <htc.h>			// 10,12,16-os PIC definiciók
#include <pic16f684.h>		// Mikrokontroller kiválasztása
#include <stdio.h>			// Alap függvények
#include <stdlib.h>			// Alap függvények
#include "header.h"			// Configurációs beállítások

#define	LED1		RC0		// Led1
#define	LED2		RC1
#define	LED3		RC2
#define	LED4		RC5
#define	LED5		RC4
#define	LED6		RC3
#define	LED7		RA0		// Led7
#define OSZIDO		80		// Oszlopok frissítési ideje
#define	SZUNET		100		// Betük közti szünet

#define GSZENZ		RA1		// Gyorsulási kapcsoló
#define GOMB		RA2		// Menü gomb

// ---------------------------- //
//  Prototípusok			    //
// ---------------------------- //
void init();
void delay(short int ms);
void karakter(char data);
void szamok(unsigned char data);

unsigned char timer_count = 0;

// ---------------------------- //
//  Interrupt				    //
// ---------------------------- //
extern interrupt isr(void) {
		TMR1H = 0x24; 
		TMR1L = 0xF4;
		timer_count++;
		TMR1IF = 0;
		//TMR2IF = 0;
		//T0IF = 0;
}

void main(void){
	unsigned char m = 0;
	short int gido = 0;

	init();
	
	while (1){
		
		// Multifunkciós gomb
		if(GOMB==0){
			while(!GOMB);
			LED7 = 1;
			delay(500);
			LED7 = 0;
			delay(5000);
			LED7 = 1;
			delay(200);
			LED7 = 0;
			m++;
			delay(100);
			if(m==6) m=0;
		}

		if(GSZENZ==0){
			if(m == 0){
				delay(1000);
				karakter('-'); delay(SZUNET);
				karakter('P'); delay(SZUNET); 
				karakter('E'); delay(SZUNET); 
				karakter('T'); delay(SZUNET); 
				karakter('I'); delay(SZUNET);
				karakter('-'); delay(SZUNET);
			}else if(m == 1){
				delay(1000);
				karakter('-'); delay(SZUNET);
				karakter('F'); delay(SZUNET); 
				karakter('E'); delay(SZUNET); 
				karakter('R'); delay(SZUNET); 
				karakter('I'); delay(SZUNET);
				karakter('-'); delay(SZUNET);
			}else if(m == 2){
				delay(1000);
				karakter('-'); delay(SZUNET);
				karakter('A'); delay(SZUNET); 
				karakter('N'); delay(SZUNET); 
				karakter('D'); delay(SZUNET); 
				karakter('I'); delay(SZUNET);
				karakter('-'); delay(SZUNET);
			}else if(m == 3){
				delay(1000);
				karakter('-'); delay(SZUNET);
				karakter('M'); delay(SZUNET); 
				karakter('O'); delay(SZUNET); 
				karakter('N'); delay(SZUNET); 
				karakter('I'); delay(SZUNET);
				karakter('-'); delay(SZUNET);
			}else if(m == 4){
				delay(1000);
				karakter('-'); delay(SZUNET);
				karakter('B'); delay(SZUNET); 
				karakter('A'); delay(SZUNET); 
				karakter('N'); delay(SZUNET); 
				karakter('D'); delay(SZUNET);
				karakter('I'); delay(SZUNET);
				karakter('-'); delay(SZUNET);
			}else if(m == 5){
				delay(1000);
				karakter('-'); delay(SZUNET);
				karakter('M'); delay(SZUNET); 
				karakter('A'); delay(SZUNET); 
				karakter('R'); delay(SZUNET); 
				karakter('X'); delay(SZUNET);
				karakter('I'); delay(SZUNET);
				karakter('M'); delay(SZUNET);
				karakter('-'); delay(SZUNET);
			}else if(m == 6){
				delay(1000);
				karakter('-'); delay(SZUNET);
				karakter('1'); delay(SZUNET); 
				karakter('4'); delay(SZUNET); 
				karakter('-'); delay(SZUNET); 
				karakter('7'); delay(SZUNET);
				karakter('-'); delay(SZUNET);
				karakter('1'); delay(SZUNET); 
				karakter('1'); delay(SZUNET);
				karakter('-'); delay(SZUNET);
			}
			//GSZENZ = 1;
		}

		
	delay(1);
	}//while
	
}//main

// ---------------------------- //
//  Függvények				    //
// ---------------------------- //
void init(){

	ANSEL = 0;				// Minden láb digitális
	CMCON0 = 7;				// Comparator kikapcsolva
	CCP1CON = 0;			// Capt/Comp/PWM kikapcsolva	
	INTCON = 0;				// Összes interrupt láb kikapcsolva
	PEIE   = 1;				// Peripheral interrupt engedélyezése
	GIE    = 1;				// Globális interrupt engedélyezése
	
	// Timer1 ((2000000/4)/8) = 62500 == 1mp
	/*T1CON = 0b00110001;
	TMR1H = 0x24; 
	TMR1L = 0xF4;
	TMR1IE = 1;*/

	// Timer 2 8MHz
	/*PR2 = 249 ;
	T2CON = 0b00101111 ;	// 16elõ és 16 utóosztás
	TMR2IE = 1;*/

	// 32.768KHz kristályhoz
	/*TMR0 = 255;				// Timer0
	OPTION = 4;				// 32-es osztás
	T0IE = 1;				// Interrupt flag engedélyezve*/

	TRISC = 0;
	TRISA = 0;
	GSZENZ = 1;				// Gyorsulási szenzort magas szintre állítjuk
	GOMB = 1;				// Menü gombot magas szintre állítjuk

}

 //---- késleltetõ függvény
 void delay(short int ms){
	short int i;
	for(i=0; i<=ms; i++);
}

void szamok(unsigned char data){
		if(data == (char)0){
			karakter('0'); delay(SZUNET);
		}else if(data == (char)1){
			karakter('1'); delay(SZUNET);
		}else if(data == (char)2){
			karakter('2'); delay(SZUNET);
		}else if(data == (char)3){
			karakter('3'); delay(SZUNET);
		}else if(data == (char)4){
			karakter('4'); delay(SZUNET);
		}else if(data == (char)5){
			karakter('5'); delay(SZUNET);
		}else if(data == (char)6){
			karakter('6'); delay(SZUNET);
		}else if(data == (char)7){
			karakter('7'); delay(SZUNET);
		}else if(data == (char)8){
			karakter('8'); delay(SZUNET);
		}else if(data == (char)9){
			karakter('9'); delay(SZUNET);
		}
}

void karakter(char data){
		switch(data){
		case '-' :
			LED7 = 0;			// .....
			LED6 = 0;			// .....
			LED5 = 0;			// .....
			LED4 = 0;			// .111.
			LED3 = 0;			// .....
			LED2 = 0;			// .....
			LED1 = 0;			// .....
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case ' ' :
			LED7 = 0;			// .....
			LED6 = 0;			// .....
			LED5 = 0;			// .....
			LED4 = 0;			// .....
			LED3 = 0;			// .....
			LED2 = 0;			// .....
			LED1 = 0;			// .....
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'A' :
			LED7 = 0;			// .....
			LED6 = 0;			// .111.
			LED5 = 1;			// 1...1
			LED4 = 1;			// 1...1
			LED3 = 1;			// 11111
			LED2 = 1;			// 1...1
			LED1 = 1;			// 1...1
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 1;
			LED4 = 1;
			LED3 = 1;
			LED2 = 1;
			LED1 = 1;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'B' :
			LED7 = 1;				// 1111.
			LED6 = 1;				// 1...1
			LED5 = 1;				// 1...1
			LED4 = 1;				// 1111.
			LED3 = 1;				// 1...1
			LED2 = 1;				// 1...1
			LED1 = 1;				// 1111.
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 1;
			LED4 = 0;
			LED3 = 1;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'C' :
			LED7 = 0;				// .111.
			LED6 = 1;				// 1...1
			LED5 = 1;				// 1....
			LED4 = 1;				// 1....
			LED3 = 1;				// 1....
			LED2 = 1;				// 1...1
			LED1 = 0;				// .111.
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'D' :
			LED7 = 1;				// 111..
			LED6 = 1;				// 1..11
			LED5 = 1;				// 1...1
			LED4 = 1;				// 1...1
			LED3 = 1;				// 1...1
			LED2 = 1;				// 1..11
			LED1 = 1;				// 111..
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 1;
			LED4 = 1;
			LED3 = 1;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'E' :
			LED7 = 1;				// 11111
			LED6 = 1;				// 1....
			LED5 = 1;				// 1....
			LED4 = 1;				// 111..
			LED3 = 1;				// 1....
			LED2 = 1;				// 1....
			LED1 = 1;				// 11111
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'F' :
			LED7 = 1;				// 11111
			LED6 = 1;				// 1....
			LED5 = 1;				// 1....
			LED4 = 1;				// 111..
			LED3 = 1;				// 1....
			LED2 = 1;				// 1....
			LED1 = 1;				// 1....
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'G' :
			LED7 = 0;				// .111.
			LED6 = 1;				// 1...1
			LED5 = 1;				// 1....
			LED4 = 1;				// 1.111
			LED3 = 1;				// 1.1.1
			LED2 = 1;				// 1...1
			LED1 = 0;				// .111.
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 1;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 1;
			LED3 = 1;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'H' :
			LED7 = 1;				// 1...1
			LED6 = 1;				// 1...1
			LED5 = 1;				// 1...1
			LED4 = 1;				// 11111
			LED3 = 1;				// 1...1
			LED2 = 1;				// 1...1
			LED1 = 1;				// 1...1
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 1;
			LED5 = 1;
			LED4 = 1;
			LED3 = 1;
			LED2 = 1;
			LED1 = 1;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'I' :
			LED7 = 0;				// .111.
			LED6 = 0;				// ..1..
			LED5 = 0;				// ..1..
			LED4 = 0;				// ..1..
			LED3 = 0;				// ..1..
			LED2 = 0;				// ..1..
			LED1 = 0;				// .111.
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 1;
			LED5 = 1;
			LED4 = 1;
			LED3 = 1;
			LED2 = 1;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'J' :
			LED7 = 0;				// .1111
			LED6 = 0;				// ....1
			LED5 = 0;				// ....1
			LED4 = 0;				// ....1
			LED3 = 0;				// ....1
			LED2 = 1;				// 1...1
			LED1 = 0;				// .111.
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 1;
			LED5 = 1;
			LED4 = 1;
			LED3 = 1;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'K' :
			LED7 = 1;				// 1...1
			LED6 = 1;				// 1..1.
			LED5 = 1;				// 1.1..
			LED4 = 1;				// 11...
			LED3 = 1;				// 1.1..
			LED2 = 1;				// 1..1.
			LED1 = 1;				// 1...1
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 1;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'L' :
			LED7 = 1;				// 1....
			LED6 = 1;				// 1....
			LED5 = 1;				// 1....
			LED4 = 1;				// 1....
			LED3 = 1;				// 1....
			LED2 = 1;				// 1....
			LED1 = 1;				// 11111
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'M' :
			LED7 = 0;				// .1.1.
			LED6 = 1;				// 1.1.1
			LED5 = 1;				// 1.1.1
			LED4 = 1;				// 1...1
			LED3 = 1;				// 1...1
			LED2 = 1;				// 1...1
			LED1 = 1;				// 1...1
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 1;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 1;
			LED4 = 1;
			LED3 = 1;
			LED2 = 1;
			LED1 = 1;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'N' :
			LED7 = 1;				// 1...1
			LED6 = 1;				// 11..1
			LED5 = 1;				// 1.1.1
			LED4 = 1;				// 1.1.1
			LED3 = 1;				// 1..11
			LED2 = 1;				// 1..11
			LED1 = 1;				// 1...1
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 1;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 1;
			LED5 = 1;
			LED4 = 1;
			LED3 = 1;
			LED2 = 1;
			LED1 = 1;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'O' :
			LED7 = 0;				// .111.
			LED6 = 1;				// 1...1
			LED5 = 1;				// 1...1
			LED4 = 1;				// 1...1
			LED3 = 1;				// 1...1
			LED2 = 1;				// 1...1
			LED1 = 0;				// .111.
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 1;
			LED4 = 1;
			LED3 = 1;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'P' :
			LED7 = 1;				// 1111.
			LED6 = 1;				// 1...1
			LED5 = 1;				// 1...1
			LED4 = 1;				// 1111.
			LED3 = 1;				// 1....
			LED2 = 1;				// 1....
			LED1 = 1;				// 1....
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 1;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'Q' :
			LED7 = 0;				// .111.
			LED6 = 1;				// 1...1
			LED5 = 1;				// 1...1
			LED4 = 1;				// 1...1
			LED3 = 1;				// 1.1.1
			LED2 = 1;				// 1..1.
			LED1 = 0;				// .11.1
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 1;
			LED4 = 1;
			LED3 = 1;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'R' :
			LED7 = 1;				// 1111.
			LED6 = 1;				// 1...1
			LED5 = 1;				// 1...1
			LED4 = 1;				// 1111.
			LED3 = 1;				// 1.1..
			LED2 = 1;				// 1..1.
			LED1 = 1;				// 1...1
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 1;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 1;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'S' :
			LED7 = 0;				// .111.
			LED6 = 1;				// 1...1
			LED5 = 1;				// 1....
			LED4 = 0;				// ..1..
			LED3 = 0;				// ....1
			LED2 = 1;				// 1...1
			LED1 = 0;				// .111.
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'T' :
			LED7 = 1;				// 11111
			LED6 = 0;				// ..1..
			LED5 = 0;				// ..1..
			LED4 = 0;				// ..1..
			LED3 = 0;				// ..1..
			LED2 = 0;				// ..1..
			LED1 = 0;				// ..1..
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 1;
			LED5 = 1;
			LED4 = 1;
			LED3 = 1;
			LED2 = 1;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'U' :
			LED7 = 1;				// 1...1
			LED6 = 1;				// 1...1
			LED5 = 1;				// 1...1
			LED4 = 1;				// 1...1
			LED3 = 1;				// 1...1
			LED2 = 1;				// 1...1
			LED1 = 0;				// .111.
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 1;
			LED5 = 1;
			LED4 = 1;
			LED3 = 1;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'V' :
			LED7 = 1;				// 1...1
			LED6 = 1;				// 1...1
			LED5 = 1;				// 1...1
			LED4 = 1;				// 1...1
			LED3 = 1;				// 1...1
			LED2 = 0;				// .1.1.
			LED1 = 0;				// ..1..
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 1;
			LED5 = 1;
			LED4 = 1;
			LED3 = 1;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'W' :
			LED7 = 1;				// 1...1
			LED6 = 1;				// 1...1
			LED5 = 1;				// 1...1
			LED4 = 1;				// 1...1
			LED3 = 1;				// 1.1.1
			LED2 = 1;				// 1.1.1
			LED1 = 0;				// .1.1.
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 1;
			LED5 = 1;
			LED4 = 1;
			LED3 = 1;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'X' :
			LED7 = 1;				// 1...1
			LED6 = 1;				// 1...1
			LED5 = 0;				// .1.1.
			LED4 = 0;				// ..1..
			LED3 = 0;				// .1.1.
			LED2 = 1;				// 1...1
			LED1 = 1;				// 1...1
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 1;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 1;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 1;
			LED1 = 1;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'Y' :
			LED7 = 1;				// 1...1
			LED6 = 1;				// 1...1
			LED5 = 0;				// .1.1.
			LED4 = 0;				// ..1..
			LED3 = 0;				// ..1..
			LED2 = 0;				// ..1..
			LED1 = 0;				// ..1..
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 1;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 1;
			LED2 = 1;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 1;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case 'Z' :
			LED7 = 1;				// 11111
			LED6 = 0;				// ....1
			LED5 = 0;				// ...1.
			LED4 = 0;				// ..1..
			LED3 = 0;				// .1...
			LED2 = 1;				// 1....
			LED1 = 1;				// 11111
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 0;
			LED5 = 1;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 1;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
			case (char)48 :
			LED7 = 0;			// .....
			LED6 = 0;			// .111.
			LED5 = 1;			// 1...1
			LED4 = 1;			// 1...1
			LED3 = 1;			// 1...1
			LED2 = 1;			// 1...1
			LED1 = 0;			// .111.
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 1;
			LED4 = 1;
			LED3 = 1;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case (char)49 :
			LED7 = 0;			// .....
			LED6 = 0;			// .11..
			LED5 = 1;			// 1.1..
			LED4 = 0;			// ..1..
			LED3 = 0;			// ..1..
			LED2 = 0;			// ..1..
			LED1 = 0;			// .111.
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 1;
			LED4 = 1;
			LED3 = 1;
			LED2 = 1;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case (char)50 :
			LED7 = 0;			// .....
			LED6 = 1;			// 1111.
			LED5 = 0;			// ....1
			LED4 = 0;			// ....1
			LED3 = 0;			// ..1..
			LED2 = 1;			// 1....
			LED1 = 1;			// 11111
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 1;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case (char)51 :
			LED7 = 0;			// .....
			LED6 = 1;			// 1111.
			LED5 = 0;			// ....1
			LED4 = 0;			// ....1
			LED3 = 0;			// .111.
			LED2 = 0;			// ....1
			LED1 = 1;			// 1111.
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 1;
			LED4 = 1;
			LED3 = 0;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case (char)52 :
			LED7 = 0;			// .....
			LED6 = 0;			// ..11.
			LED5 = 0;			// .1.1.
			LED4 = 1;			// 1..1.
			LED3 = 1;			// 11111
			LED2 = 0;			// ...1.
			LED1 = 0;			// ..111
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 1;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 1;
			LED4 = 1;
			LED3 = 1;
			LED2 = 1;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case (char)53 :
			LED7 = 0;			// .....
			LED6 = 0;			// .111.
			LED5 = 1;			// 1....
			LED4 = 1;			// 1....
			LED3 = 1;			// 1111.
			LED2 = 0;			// ....1
			LED1 = 1;			// 1111.
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case (char)54 :
			LED7 = 0;			// .....
			LED6 = 0;			// .111.
			LED5 = 1;			// 1....
			LED4 = 1;			// 1....
			LED3 = 1;			// 1111.
			LED2 = 1;			// 1...1
			LED1 = 0;			// .111.
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case (char)55 :
			LED7 = 0;			// .....
			LED6 = 1;			// 11111
			LED5 = 0;			// ....1
			LED4 = 0;			// ...1.
			LED3 = 0;			// ..1..
			LED2 = 0;			// .1...
			LED1 = 1;			// 1....
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 1;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case (char)56 :
			LED7 = 0;			// .....
			LED6 = 0;			// .111.
			LED5 = 1;			// 1...1
			LED4 = 1;			// 1...1
			LED3 = 0;			// .111.
			LED2 = 1;			// 1...1
			LED1 = 0;			// .111.
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 0;
			LED3 = 1;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 1;
			LED4 = 1;
			LED3 = 0;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case (char)57 :
			LED7 = 0;			// .....
			LED6 = 0;			// .111.
			LED5 = 1;			// 1...1
			LED4 = 0;			// .1111
			LED3 = 0;			// ....1
			LED2 = 0;			// ....1
			LED1 = 0;			// .111.
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 0;
			LED4 = 1;
			LED3 = 0;
			LED2 = 0;
			LED1 = 1;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 1;
			LED5 = 1;
			LED4 = 1;
			LED3 = 1;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		case (char)58 :
			LED7 = 0;			// .....
			LED6 = 0;			// .....
			LED5 = 0;			// ..1..
			LED4 = 0;			// .....
			LED3 = 0;			// .....
			LED2 = 0;			// ..1..
			LED1 = 0;			// .....
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 1;
			LED4 = 0;
			LED3 = 0;
			LED2 = 1;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED7 = 0;
			LED6 = 0;
			LED5 = 0;
			LED4 = 0;
			LED3 = 0;
			LED2 = 0;
			LED1 = 0;
			delay(OSZIDO);
			LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
			delay(OSZIDO);
			break;
		default :
		LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
	}
}