require 'pry'

class SaladCypher
  attr_reader(:transformation, :shift)

  ALPHABET = (('a'..'z').to_a + ('A'..'Z').to_a).join

  def initialize(msg:, shift:)
    #APPARENTLY FOR NAMED PARAMETERS THE COLON GOES ON THE WRONG SIDE, THAT'S STUPID AS SHIT
    # oh it's so you can specify defaults ('msg:nil'), what an asshole thing to do
    @msg = msg
    @shift = shift
    @transformation = ""
  end

  def cypher()
    @msg.each_char do |x|
      if ALPHABET.include?(x)
        @transformation += ALPHABET[rap(x)]
        @transformation.downcase!
      else
        @transformation += x
      end
    end
    @transformation
    # @transformation.downcase!
  end

  def rap(pants)
    (ALPHABET.index(pants) + @shift) % ALPHABET.length
  end

end


#
##  8=====D~

  # def reverse()
  #   @transformation
  # end

  # prints "blahblahbalh?"
  # @response = gets.chomp

  # if @response = Y
  #     -salad.shift
  # end



