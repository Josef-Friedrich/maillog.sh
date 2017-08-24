[![Build Status](https://travis-ci.org/JosefFriedrich-shell/maillog.sh.svg?branch=master)](https://travis-ci.org/JosefFriedrich-shell/maillog.sh)

# maillog.sh


## Summary / Short description

> Wrapper script to easily send log informations by email.

## Usage

```
Usage: maillog.sh [-b BODY ] <subject> <text-file-to-send>

Wrapper script to easily send log informations by email.

This script is designed to be used in Shell scripts. By design there is
no '-e' to specify an email address. The email address should be stored
in the 'rc' (run control) files of your shell (for more informations
read the next lines). The maillog.sh script can be used in many
places of your scripts. Because the email address is only stored on
one place, the address can easily be changed and you not have to edit
all your scripts.

# Use cases

## Send a temporay and manually created log file:

	echo 'Some log messages' > /tmp/logs
	echo '... and more log message' >> /tmp/logs
	maillog.sh 'Log subject' /tmp/logs

## Specify the body text by a command line option:

	maillog.sh -b 'Some log messages' 'Log subject'

## Pipe to maillog.sh:

	echo 'Some log messages' | maillog.sh 'Log subject'

# How to specify the email address?

1. Edit this script (maillog.sh) and
place your log email address on line 3

	MAILLOG_EMAIL=yourmail@example.com

or / and:

2. Add this line to your ~.bashrc, ~.bash_profile or ~.zshrc or
whatever your run control file of your shell is:

export MAILLOG_EMAIL=yourmail@example.com

Don't forget to execute your scripts in a login shell (e. g. bash -l)
in order to get the 'MAILLOG_EMAIL' variable.

Options:
	-b BODY:  Text for the body of the mail.
	-h:       Show this help text.
	-t:       Send a test mail (no further arguments needed).
```
## Testing

```
make test
```

