require 'pry'

class SaladCypher
  attr_reader(:transformation, :shift)

  ALPHABET = ('a'..'z').to_a
  OTHER_ALPHABET = ('A'..'Z').to_a

  def initialize(msg:, shift:)
    #APPARENTLY FOR NAMED PARAMETERS THE COLON GOES ON THE WRONG SIDE, THAT'S STUPID AS SHIT
    # oh it's so you can specify defaults ('msg:nil'), what an asshole thing to do
    raise "WRONG FUCKING NUMBER, STUPID" if shift == 0
    @msg = msg
    @shift = shift
    @transformation = ""
  end

  def cypher
    @msg.each_char do |x|
      if ALPHABET.include?(x)
        @transformation += ALPHABET[rap(x, ALPHABET)]
        # @transformation.downcase!
      elsif OTHER_ALPHABET.include?(x)
        @transformation += OTHER_ALPHABET[rap(x, OTHER_ALPHABET)]
      else
        @transformation += x
      end
    end
    @transformation
  end

  def rap(pants, origin)
    (origin.index(pants) + @shift) % origin.length
  end

  def reverse
    # @transformation
  end

end


#
##  8=====D~

  # prints "blahblahbalh?"
  # @response = gets.chomp

  # if @response = Y
  #     -salad.shift
  # end



