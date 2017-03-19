Run after a long-running command to get a notification when the command finishes.

For example:
`./my-really-slow-script.sh; notify`

To get a notification for an already running command, press ^Z to pause the command, then run:
`fg; notify`
which will resume the command and display a notification when it finishes.
