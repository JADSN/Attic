#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/socket.h>
#include <arpa/inet.h>
 
#define LEN 256
in_addr_t RandIPv4();
 
int
main ()
{
	in_addr_t ip = RandIPv4();
	char addr_str[LEN];
	const time_t timer = time(NULL);
	printf("ctime is %s\n", ctime(&timer));
	printf("%d\n", (int)ip);
	inet_ntop(AF_INET, &ip, addr_str, LEN);
	printf("%s\n", addr_str);
	return 0;
}
 
in_addr_t RandIPv4()
{
	srand(time(NULL));
	return rand()%0xffffffff + 0x1;
}
