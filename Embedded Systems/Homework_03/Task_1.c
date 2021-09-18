#ifndef F_CPU
#define F_CPU 16000000UL
#endif

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

#include "serial.h"
#include "encoder.h"
#include "motor.h"
#include "timer.h"

volatile uint64_t ms = 0;

volatile int32_t P, I, D;

volatile int64_t err = 0;
volatile int64_t err_old = 0;
volatile int64_t err_acc = 0;
volatile int64_t err_diff = 0;

volatile int64_t gain = 0;
volatile int64_t speed = 0;
volatile int64_t max = 1023;

volatile int16_t tps = 0;
volatile int16_t tps_m = 0;

volatile uint8_t change = 0;

void reset_errors ()
{
	err = 0;
	err_old = 0;
	err_acc = 0;
	err_diff = 0;
}

volatile uint8_t sendToPlotter = 0;

ISR(TIMER0_COMPA_vect)
{
	/*
	Stavljamo if prije incrementanja ms-a da nam se okine pri prvom pozivanju ISR-a, 
	te prvo postavljamo tps na 500 da nam dodje do referentnog stanja te kasnije samo samo variramo između 1000 i 1500.
	Jer zelimo mijenjati referentno stanje svake dvije sekunde, 
	onda zelimo podijeliti tickove potrebne da dodjemo od jednog do drugog s dva tako da svaka sekunda odradi jednak broj tickova.
	*/
	if(ms % 2000 == 0){
		if(change == 0){
			tps = 500;
			change = 1;
		}
		else if(change == 1){
			tps = 250;
			change = 2;
		}
		else{
			tps = -250;
			change = 1;
		}
	}
	
	ms++;		

	

	if (ms % 10 == 0)
	{
		sendToPlotter = 1;
	}
	

	
	if (ms % 10 == 0)
	{
		tps_m = (ticks - ticks_old) * 1000 / 10;

		err = tps - tps_m;
		err_acc += err;
		err_diff = err - err_old;
		gain = P * err + I * err_acc + D * err_diff;
		gain /= 13;

		if (gain > 0)
		{
			speed = gain > max ? max : gain;
			OCR1A = speed;
			OCR1B = 0;
		}
		else
		{	
			gain *= -1;
			speed = gain > max ? max : gain;
			OCR1B = speed;
			OCR1A = 0;
		}

		err_old = err;
		ticks_old = ticks;
	}
}

int main ()
{
	uart_init();
	encoder_init();
	motor_init();
	counter_init();

	P = 23;
	I = 6;
	D = 10;
	
	while(1)
	{	

		if (sendToPlotter)
		{
			uart_putint(tps);
			uart_putstr("\n");
			uart_putint(tps_m);
			uart_putstr("\n");
		}
	}

	return 0;
}