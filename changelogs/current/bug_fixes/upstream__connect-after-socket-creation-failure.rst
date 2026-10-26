Fixed a crash when an upstream client connection could not create its socket (for example because
``socket(2)`` failed with ``EMFILE``). The connection was already scheduled to close, but owners
such as the TCP connection pool still called ``connect()`` on it, which used the missing socket.
``connect()`` now returns early in this case and the connection is closed as a regular connection
failure.
