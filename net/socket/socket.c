// see http://man7.org/linux/man-pages/man2/socket.2.html
// socket - create an endpoint for communication

// see http://man7.org/linux/man-pages/man7/ip.7.html

// #include <sys/socket.h>
// #include <netinet/in.h>
// #include <netinet/ip.h> /* superset of previous */
//
// tcp_socket = socket(AF_INET, SOCK_STREAM, 0);
// udp_socket = socket(AF_INET, SOCK_DGRAM, 0);
// raw_socket = socket(AF_INET, SOCK_RAW, protocol);

#include <sys/types.h>
#include <sys/socket.h>

//int socket(int domain, int type, int protocol);

// socket() creates an endpoint for communication and returns a file
// descriptor that refers to that endpoint.  The file descriptor
// returned by a successful call will be the lowest-numbered file
// descriptor not currently open for the process.

// The *domain* argument specifies a communication domain; this selects
// the protocol family which will be used for communication.  These
// families are defined in <sys/socket.h>.  The formats currently
// understood by the Linux kernel include:

//       Name         Purpose                                    Man page
//       AF_UNIX      Local communication                        unix(7)
//       AF_LOCAL     Synonym for AF_UNIX
//       AF_INET      IPv4 Internet protocols                    ip(7)
//       AF_AX25      Amateur radio AX.25 protocol               ax25(4)
//       AF_IPX       IPX - Novell protocols
//       AF_APPLETALK AppleTalk                                  ddp(7)
//       AF_X25       ITU-T X.25 / ISO-8208 protocol             x25(7)
//       AF_INET6     IPv6 Internet protocols                    ipv6(7)
//       AF_DECnet    DECet protocol sockets
//       AF_KEY       Key management protocol, originally
//                    developed for usage with IPsec
//       AF_NETLINK   Kernel user interface device               netlink(7)
//       AF_PACKET    Low-level packet interface                 packet(7)
//       AF_RDS       Reliable Datagram Sockets (RDS) protocol   rds(7)
//                                                               rds-rdma(7)
//       AF_PPPOX     Generic PPP transport layer, for setting
//                    up up L2 tunnels (L2TP and PPPoE)
//       AF_LLC       Logical link control (IEEE 802.2 LLC)
//                    protocol
//       AF_IB        InfiniBand native addressing
//       AF_MPLS      Multiprotocol Label Switching
//       AF_CAN       Controller Area Network automotive bus
//                    protocol
//       AF_TIPC      TIPC, "cluster domain sockets" protocol
//       AF_BLUETOOTH Bluetooth low-level socket protocol
//       AF_ALG       Interface to kernel crypto API
//       AF_VSOCK     VSOCK (originally "VMWare VSockets")       vsock(7)
//                    protocol for hypervisor-guest
//                    communication
//       AF_KCM       KCM (kernel connection multiplexor)
//                    interface
//       AF_XDP       XDP (express data path) interface

// The socket has the indicated *type*, which specifies the communication
// semantics.  Currently defined types are:

//       SOCK_STREAM     Provides sequenced, reliable, two-way, connection-
//                       based byte streams.  An out-of-band data transmission
//                       mechanism may be supported.
//
//       SOCK_DGRAM      Supports datagrams (connectionless, unreliable
//                       messages of a fixed maximum length).
//
//       SOCK_SEQPACKET  Provides a sequenced, reliable, two-way connection-
//                       based data transmission path for datagrams of fixed
//                       maximum length; a consumer is required to read an
//                       entire packet with each input system call.
//
//       SOCK_RAW        Provides raw network protocol access.
//
//       SOCK_RDM        Provides a reliable datagram layer that does not
//                       guarantee ordering.
//
//       SOCK_PACKET     Obsolete and should not be used in new programs; see
//                       packet(7).
//
//       Some socket types may not be implemented by all protocol families.
//
//       Since Linux 2.6.27, the type argument serves a second purpose: in
//       addition to specifying a socket type, it may include the bitwise OR
//       of any of the following values, to modify the behavior of socket():
//
//       SOCK_NONBLOCK   Set the O_NONBLOCK file status flag on the open file
//                       description (see open(2)) referred to by the new file
//                       descriptor.  Using this flag saves extra calls to
//                       fcntl(2) to achieve the same result.
//
//       SOCK_CLOEXEC    Set the close-on-exec (FD_CLOEXEC) flag on the new
//                       file descriptor.  See the description of the
//                       O_CLOEXEC flag in open(2) for reasons why this may be
//                       useful.
