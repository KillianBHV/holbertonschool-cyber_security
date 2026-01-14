#!/usr/bin/env ruby
class CaesarCipher
  def initialize(shift)
    @shift = shift
  end

  def encrypt(message)
    cipher(message, @shift)
  end

  def decrypt(message)
    cipher(message, -@shift)
  end

  private

  def cipher(message, shift)
    result = ""

    message.each_char do |ch|
      if c >= 'A' and c <= 'Z'
        result << ((c.ord - 65 + shift) % 26 + 65).chr
      elsif c >= 'a' and c <= 'z'
        result << ((c.ord - 97 + shift) % 26 + 97).chr
      else
        result << c
      end
    end

    return result
  end
end
