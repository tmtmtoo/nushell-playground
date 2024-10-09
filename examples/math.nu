#!/usr/bin/env nu

export def pow [value: int, exponent: int]: [nothing -> int] {
    mut acc = $value;
    for _ in 1..<$exponent {
        $acc = $acc * $value
    }
    $acc
}
