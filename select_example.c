// taken from http://www.tenouk.com/Module40a.html

       #include <stdio.h>
       #include <stdlib.h>
       #include <sys/time.h>
       #include <sys/types.h>
       #include <unistd.h>

       int
       main(void)
       {
           fd_set rfds;
           struct timeval tv;
           int retval;

           /* Watch stdin (fd 0) to see when it has input. */
           FD_ZERO(&rfds);
           FD_SET(0, &rfds);

           /* Wait up to five seconds. */
           tv.tv_sec = 5;
           tv.tv_usec = 0;

           retval = select(1, &rfds, NULL, NULL, &tv);
           /* Don't rely on the value of tv now! */

           if (retval == -1)
               perror("select()");
           else if (retval)
               printf("Data is available now.\n");
               /* FD_ISSET(0, &rfds) will be true. */
           else
               printf("No data within five seconds.\n");

           exit(EXIT_SUCCESS);
       }

#if 0
int passiveUDP(const char *service)
{
  return passivesock(service, "udp", 0);
}
u_short portbase = 0;

int passivesock(const char *service, const char *transport, int qlen)
{
  struct servent  *pse;
  struct protoent *ppe;
  struct sockaddr_in sin;
  int     s, type;
  memset(&sin, 0, sizeof(sin));
  sin.sin_family = AF_INET;
  sin.sin_addr.s_addr = INADDR_ANY;
  /* Map service name to port number */
  if(pse = getservbyname(service, transport))
    sin.sin_port = htons(ntohs((u_short)pse->s_port) + portbase);
  else if((sin.sin_port = htons((u_short)atoi(service))) == 0)
    errexit("can't get \"%s\" service entry\n", service);
  /* Map protocol name to protocol number */
  if((ppe = getprotobyname(transport)) == 0)
    errexit("can't get \"%s\" protocol entry\n", transport);
  /* Use protocol to choose a socket type */
  if(strcmp(transport, "udp") == 0)
    type = SOCK_DGRAM;
  else
    type = SOCK_STREAM;
  /* Allocate a socket */
  s = socket(PF_INET, type, ppe->p_proto);
  if(s < 0)
    errexit("can't create socket: %s\n", strerror(errno));
  /* Bind the socket */
  if(bind(s, (struct sockaddr *)&sin, sizeof(sin)) < 0)
    errexit("can't bind to %s port: %s\n", service, strerror(errno));
  if(type == SOCK_STREAM && listen(s, qlen) < 0)
    errexit("can't listen on %s port: %s\n", service, strerror(errno));
  return s;
}
/* main() - Iterative UDP server for TIME service */
int main(int argc, char *argv[ ])
{
  struct sockaddr_in fsin;
  char *service = "time";
  char buf[1];
  int sock;
  time_t now;
  int alen;
  sock = passiveUDP(service);
  while (1)
  {
    alen = sizeof(fsin);
    if(recvfrom(sock, buf, sizeof(buf), 0, (struct sockaddr *)&fsin, &alen) < 0)
      errexit("recvfrom: %s\n", strerror(errno));
    time(&now);
    now = htonl((u_long)now);
    sendto(sock, (char *)&now, sizeof(now), 0, (struct sockaddr *)&fsin, sizeof(fsin));
  }
}

#endif
