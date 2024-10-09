#!/usr/bin/env nu

use std assert
use math.nu pow

export def main [] {
    let actual = pow 7 3
    let expected = 343
    assert equal $actual $expected
}
