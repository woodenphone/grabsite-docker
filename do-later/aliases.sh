#!/bin/bash
## Convenience aliases for use with the grabsite container.
## USAGE: $ source aliases.sh
alias grab-site='sudo docker exec "grabsite" "/grabsite/gs-add.sh"'
alias gs-server='sudo docker run "grabsite"'
alias gs-abort='sudo docker exec "grabsite" "/grabsite/gs-abort.sh"'
alias gs-resume='sudo docker exec "grabsite" "/grabsite/gs-resume.sh"'