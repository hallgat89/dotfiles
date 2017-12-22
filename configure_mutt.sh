#!/bin/bash

echo "Configuring mutt"
echo ""
echo "Type your Gmail address:"
secret-tool store --label=imap_user user `whoami` gmail name
echo "Type your google password:"
secret-tool store --label=imap_user_pass user `whoami` gmail pass
echo "Done."
