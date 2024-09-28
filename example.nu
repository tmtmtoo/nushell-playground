#!/usr/bin/env nu

def get_my_origin []: nothing -> string {
    http get https://httpbin.org/get | get origin
}

export def main [] {
    get_my_origin | print
}
