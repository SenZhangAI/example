// see http://man7.org/linux/man-pages/man7/epoll.7.html

#include<stdio.h> // void perror(const char *s);

#include<unistd.h> // int close(int fd);

#include<stdlib.h> //EXIT_FAILURE

#include <sys/types.h>   //for history some reason (BSD) implementations need it
#include <sys/socket.h>  //int accept(int sockfd, struct sockaddr *addr, socklen_t *addrlen);

#include<sys/epoll.h>

#define MAX_EVENTS 10

int main(int argc, char* argv[]) {
    printf("start...\n");
    struct epoll_event ev, events[MAX_EVENTS];
    int listen_sock, conn_sock, nfds, epollfd;

    epollfd = epoll_create1(0);
    if (epollfd == -1) {
        perror("epoll_create1");
        exit(EXIT_FAILURE);
    }

    ev.events = EPOLLIN;
    ev.data.fd = listen_sock;
    if (epoll_ctl(epollfd, EPOLL_CTL_ADD, listen_sock, &ev) == -1) {
        perror("epoll_ctl: listen_sock");
        exit(EXIT_FAILURE);
    }

    while (1) {
        nfds = epoll_wait(epollfd, events, MAX_EVENTS, -1);
        if (nfds == -1) {
            perror("epoll_wait");
            exit(EXIT_FAILURE);
        }

        int n;
        for (n = 0; n < nfds; ++n) {
            if (events[n].data.fd == listen_sock) {
                conn_sock = accept(listen_sock, (struct sockaddr *) &addr, &addrlen);
                if (conn_sock == -1) {
                    perror("accept");
                    exit(EXIT_FAILURE);
                }
                setnonblocking(conn_sock);
                ev.events = EPOLLIN | EPOLLET;
                ev.data.fd = conn_sock;
                if (epoll_ctl)
            }
        }

    }


    if (close(epollfd) != 0) {
        perror("close_epoll");
        exit(EXIT_FAILURE);
    }

    printf("end\n");
    return 0;
}
