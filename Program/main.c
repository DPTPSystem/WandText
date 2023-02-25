/* DPTP SYSTEM - WandClock 1.0
 * Dátum:   2014 júl. 9. Szerda
 * DPTP SYSTEM - WandClock 2.0
 * Dátum:   2014 júl. 27. Szerda
 * Email:	don_peter@freemail.hu
 * Processor: PIC16F684
 * Fórdító:  HI-TECH C for PIC10/12/16
 * DPTP System - Wand Text v2.10
 * Újra gondolva és gyártatva
 * Dátum:   2023 Feb. 24. Péntek
 */

#include <htc.h>			// 10,12,16-os PIC definiciók
#include <pic16f684.h>		// Mikrokontroller kiválasztása
#include <stdio.h>			// Alap függvények
#include <stdlib.h>
#include <string.h>
#include "header.h"			// Configurációs beállítások
#include "abc.c"

#define	LED1		RA0		// Led1
#define	LED2		RC0
#define	LED3		RC1
#define	LED4		RC2
#define	LED5		RC5
#define	LED6		RC3
#define	LED7		RC4		// Led7
#define OSZIDO		80		// Oszlopok frissítési ideje
#define	SZUNET		120		// Betük közti szünet
#define Tetlen_mp	30		// 30mp tétlenség
#define GSZENZ		RA1		// Gyorsulási kapcsoló
#define GOMB		RA2		// Menü gomb

// ---------------------------- //
//  Prototípusok			    //
// ---------------------------- //
void init();
void delay(short int ms);
unsigned char karakteratvalto(unsigned char karakter);
void karakter(unsigned char karakter, unsigned char irany);
void Wand_Text(char *pointer, unsigned char irany);
char *asd(char* in, char *out);

unsigned short int timer_count = 0;		// Timer számláló
unsigned char mp_count = 0;			// Másodperc számláló


// ---------------------------- //
//  Interrupt				    //
// ---------------------------- //
extern interrupt isr(void) {
	//TMR1H = 0x24; 
	//TMR1L = 0xF4;
	timer_count++;
			
	if(timer_count >= 1000){
		LED7 = 1;
		delay(100);
		LED7 = 0;
		timer_count = 0;
		mp_count++;
		if(mp_count >= Tetlen_mp){
			TRISA = 4;
			TRISC = 0;
			PORTA = 0;
			PORTC = 0;
			IOCA = 0b00000100;	// Gomb (RA2) beálítva megszakításra
			T0IE = 0;			// Timer0 interrupt kikapcsolva
			mp_count = 0;
			timer_count = 0;
			asm("SLEEP");
		}
	}
	
	if(RAIF == 1){
		RAIF = 0;
		IOCA = 0;		// IOCA kikapcsolva (RA2 Gomb megszakítás)
		RAIF = 0;		// A port interrupt flag törlése
		TRISA = 6;		// RA1 és RA2 bemenet
		TRISC = 0;		// C port kimenet
		PORTA = 0;		// A port alacsony szinten
		PORTC = 0;		// C port alacsony szinten
		T0IE = 1;		// Timer0 interrupt engedélyezve
		asm("NOP");
	}
	
	//TMR1IF = 0;
	//TMR2IF = 0;		// Timer megszakítás flag törlése
	T0IF = 0;
}

void main(void){
	unsigned char m = 0, i;
	short int gido = 0;

	init();
	
	while (1){
		
		// Multifunkciós gomb
		if(GOMB==1){
			while(GOMB==1);
			LED7 = 1;
			delay(500);
			LED7 = 0;
			delay(5000);
			LED7 = 1;
			delay(200);
			LED7 = 0;
			m++;
			delay(100);
			if(m==10) m=0;
			mp_count = 0;	// Tétlenség mérésének nullázása
		}
		
		if(GSZENZ == 1){
			if(m == 0){
				delay(2000);
				Wand_Text("PETI", '1');
				//Wand_Text("FERI", '1');
			}else if(m == 1){
				delay(2000);
				Wand_Text("ANDI", '1');
				//Wand_Text("MONI", '1');
			}else if(m == 2){
				delay(2000);
				Wand_Text("LACI", '1');
				//Wand_Text("NIKI", '1');
			}else if(m == 3){
				delay(2000);
				Wand_Text("MARTI", '1');
				//Wand_Text("KRISTOF", '1');
			}else if(m == 4){
				delay(2000); 
				Wand_Text("OPEL", '1');
				//Wand_Text("BMW M5", '1');
			}else if(m == 5){
				delay(2000);
				Wand_Text("BEACH", '1'); 
				//Wand_Text("ERDELY", '1'); 
			}else if(m == 6){
				delay(2000);
				Wand_Text("TIROL", '1');
				//Wand_Text("-F27-", '1');
			}else if(m == 7){
				delay(2000);
				Wand_Text("MUTER", '1');
			}else if(m == 8){
				delay(2000);
				Wand_Text("WAND C", '1');
				//Wand_Text("NYUNYI", '1');
			}else if(m == 9){
				delay(2000);
				Wand_Text("DPTP", '1');
			}
			mp_count = 0;	// Tétlenség mérésének nullázása
		}
	
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
	OSCCON = 0b01110000;	// 8MHz-es órajel beállítva
	
	// 32.768KHz kristályhoz
	TMR0 = 249;				// Timer0
	OPTION = 2;				// 8-es osztás
	T0IE = 1;				// Interrupt engedélyezve
	
	
	// Timer1 ((2000000/4)/8) = 62500 == 1mp
	/*T1CON = 0b00110001;	//(FOSC/4)/8
	TMR1H = 0x24; 
	TMR1L = 0xF4;
	TMR1IE = 1;*/

	// Timer 2 8MHz
	/*PR2 = 250 ;
	T2CON = 0b00111111;		// 8millió / 16elõ és 8 utóosztás == 62.500/250 == 250 == 50lefutás ~1mp
	TMR2IE = 1;*/
	
	// Sleep üzemmód beállítása
	IOCA = 0;				// ICOA kikapcsolva
	RAIF = 0;				// A prot interrupt flag nullázása
	RAIE = 1;				// A port interrupt engedélyezése
	TRISC = 0;				// kimenet
	TRISA = 6;				// RA1 Gyorsulási szenzort és RA2 Menü gomb bemenet többi kimenet
	PCON = 0b0010000;		// Ultra alacsony energia engedélyezve (wake-up)
	PORTC = 0;				// C port alacsony szinten
	PORTA = 0;				// A port alacsony szinten
}

 //---- késleltetõ függvény
 void delay(short int ms){
	short int i;
	for(i=0; i<=ms; i++);
}

unsigned char karakteratvalto(unsigned char karakter){
    static char chars[40] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-:. ";
    unsigned char i, result;
    for(i=0; i<40; i++){
        if(karakter == chars[i]){
            result = i;
            break;
        }
    }
    return result;
}

void karakter(unsigned char karakter, unsigned char irany){
    unsigned char i;
    unsigned char mask;
    for(i=0; i<5; i++){
        mask = (irany=='0') ? i : 4-i;
		LED1 = ABC[karakter][6]>>mask;
		LED2 = ABC[karakter][5]>>mask;
		LED3 = ABC[karakter][4]>>mask;
		LED4 = ABC[karakter][3]>>mask;
		LED5 = ABC[karakter][2]>>mask;
		LED6 = ABC[karakter][1]>>mask;
		LED7 = ABC[karakter][0]>>mask;
        delay(OSZIDO);
		LED1 = LED2 = LED3 = LED4 = LED5 = LED6 = LED7 = 0;
		delay(OSZIDO);
    }
	delay(SZUNET);
}

void Wand_Text(char *pointer, unsigned char irany){
    unsigned char i=0;
    while(pointer[i]){
        karakter(karakteratvalto(pointer[i]), irany);
        i++;
    }
}