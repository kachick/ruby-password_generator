# coding: us-ascii

$VERBOSE = true

require_relative '../lib/password_generator'

p PasswordGenerator.generate(8)
p PasswordGenerator.generate(24, avoid_symbols: true)
p PasswordGenerator.generate(24, avoid_downcases: true)
p PasswordGenerator.generate(24, avoid_uppercases: true)