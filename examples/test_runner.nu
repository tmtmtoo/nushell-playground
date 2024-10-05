#!/usr/bin/env nu

use std log

ls **/*.test.nu
  | get name 
  | each {|name|
      let result = nu $name | complete
      let desc = if $result.exit_code == 0 {
        log info $"($name): success"
      } else {
        log error $"($name): fail"
        print -e $result.stderr
      }
    }

return null
