Fixed a crash in HTTP/3 upstream connections when the socket for port migration or connection
migration could not be created. The new path was probed through the failed socket. Path validation
now fails cleanly and the connection stays on its current path.
