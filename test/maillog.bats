#!/usr/bin/env bat

setup() {
	. ./test/test-helper.sh
	mock_path $(pwd)/test/bin
	MAILLOG_EMAIL=test@example.com
}

@test "execute: maillog.sh" {
	run ./maillog.sh
	[ "$status" -eq 1 ]
	[ "${lines[0]}" = "Usage: maillog.sh [-b BODY ] <subject> <text-file-to-send>" ]
}

@test "execute: maillog.sh -h" {
	run ./maillog.sh -h
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "Usage: maillog.sh [-b BODY ] <subject> <text-file-to-send>" ]
}

@test "execute: maillog.sh -t" {
	run ./maillog.sh -t
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "Sending test mail to test@example.com." ]
	[ "${lines[1]}" = "-s Test mail test@example.com" ]
}
