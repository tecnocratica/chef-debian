#!/usr/bin/env bats

load test_helper

@test "sources.list is configured" {
    local mirror='http://ftp.nl.debian.org/debian'
    grep -qE "^deb\s+$(regexp_escape $mirror) $(codename) main contrib non-free$" /etc/apt/sources.list
}

@test "apt-get update succeeds" {
    run sudo apt-get update
    [ $status -eq 0 ]
}
