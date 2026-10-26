Fixed UDP sockets aborting the process when the kernel truncated the control messages of a received
packet (``MSG_CTRUNC``). Such packets are now dropped like truncated packets. ``recvmsg()`` now also
offers the kernel the space reserved for ``save_cmsg_config`` control messages.
