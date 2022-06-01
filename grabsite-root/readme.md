# Container: grabsite-root
Runs entrypoint as root and switches user.

Entrypoint running as root permits fixing volume/mount locations; as existance, ownership, and permissions are not assured at startup-time.