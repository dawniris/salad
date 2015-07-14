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
    @string = logic(@string || @msg)
  end

  def logic(word) #This is where the named param with a default will go - ternaries
    pasta = []
    word.each_char do |x|
      if ALPHABET.include?(x)
        pasta << ALPHABET[rap(x, ALPHABET)]
        # @transformation.downcase!
      elsif OTHER_ALPHABET.include?(x)
        pasta << OTHER_ALPHABET[rap(x, OTHER_ALPHABET)]
      else
        pasta << x
      end
    end
    pasta.join
  end

  ### WRITE YOUR STUPID TESTS FIRST
  ### ^^^this fuckin logic is recyclable blam! // named params & send //
  ## figure out recursive self.new (more complex in cognitive overhead but looks better) out of spite

  def rap(pants, origin)
    (origin.index(pants) + @shift) % origin.length
  end

  def reverse_rap(pants, origin)
    (origin.index(pants) - @shift) % origin.length
  end

## would it be possible to interpolate (no) or specify a conditional (maybe) that designated whether the method
 # was supposed to +@shift or -@shift?

  def reverse
    cypher
    @transformation.each_char do |x|
          # binding.pry
      if ALPHABET.include?(x)
        @transformation += ALPHABET[reverse_rap(x, ALPHABET)]
        # @transformation.downcase!
      elsif OTHER_ALPHABET.include?(x)
        @transformation += OTHER_ALPHABET[reverse_rap(x, OTHER_ALPHABET)]
      else
        @transformation += x
      end
    end
    @transformation
  end



end

##  8=====D~


