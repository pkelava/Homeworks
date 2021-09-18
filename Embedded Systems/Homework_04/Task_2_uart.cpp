#include <unistd.h>
#include <stdint.h>
#include <stdio.h>

#include <fcntl.h>
#include <termios.h>

#ifndef UART_PATH
#define UART_PATH "/dev/serial0"
#endif

void init_uart(int& file_dest)
{
    file_dest = open(UART_PATH, O_RDWR);

    if(file_dest == -1)
        perror("Error: Unable to open UART\n");

    termios options{};
    
    options.c_cflag = B9600 | CS8 | CREAD | CLOCAL;
    options.c_iflag = IGNPAR;

    options.c_oflag = 0;
    options.c_lflag = 0;

    tcflush(file_dest, TCIFLUSH);
    tcsetattr(file_dest, TCSANOW, &options);
}

void send_byte(int& file_dest, uint8_t& b)
{
    if(file_dest == -1)
        perror("Error: Unable to open UART\n");

    uint16_t buffer[1] = {b};

    if (write(file_dest, buffer, 1) < 0)
        perror("Error: TX\n");
}

void receive_byte(int& file_dest, uint16_t& b)
{
    uint8_t buffer[2] = {};

    if(file_dest != -1)
    {
        read(file_dest, static_cast<void*>(buffer), 2);

        b = (buffer[0] << 8) | buffer[1];
    }
    else
        perror("Error: RX\n");
}

int main ()
{
    int file_dest{};

    init_uart(file_dest);

    uint16_t receiver{0};

    while (1)
    {
        receive_byte(file_dest, receiver);

        printf("%u\n",receiver);

        usleep(100000);
    }

    close(file_dest);
    return 0;
}