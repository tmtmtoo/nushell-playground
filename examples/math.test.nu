#!/usr/bin/env nu

use std assert
use math.nu pow

export def main [] {
    let actual = pow 100
    let expected = 10000
    assert equal $actual $expected
}
