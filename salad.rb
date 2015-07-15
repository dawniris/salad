require 'pry'

class SaladCypher
  attr_reader(:transformation, :shift)

  ALPHABET = ('a'..'z').to_a
  OTHER_ALPHABET = ('A'..'Z').to_a

  def initialize(msg:, shift:) #method:rap ??
    #APPARENTLY FOR NAMED PARAMETERS THE COLON GOES ON THE WRONG SIDE, THAT'S STUPID AS SHIT
    # oh it's so you can specify defaults ('msg:nil'), what an asshole thing to do
    raise "WRONG FUCKING NUMBER, STUPID" if shift == 0
    @msg = msg
    @shift = shift
    @transformation = ""
  end

  def cypher
    @string = logic(@string || @msg) #, method: 'reverse_rap')
  end

  def logic(word, method:'rap')

  # This is where the named param with a default will go - ternaries
  #   ## +@shift ? value = 'rap' : value = 'reverse_wrap' ... but then 'value' is the method called
  #   but this doesn't work because @shift is only 'assigned a value' (in the loosest sense) in the wrap method itself
  #   instead, probably use a 'forward' vs. 'backward' assignment ?
  #   but then how does attr_accessor learn about the assignment? Because the param needs to get passed from balls to salad.

    pasta = []
    word.each_char do |x|
      if ALPHABET.include?(x)
        pasta << ALPHABET[rap(x, ALPHABET)] #stop asking this stupid 'how to switch method' question and remember fucking .send
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
    @string.each_char do |x|
      if ALPHABET.include?(x)
        @transformation += ALPHABET[reverse_rap(x, ALPHABET)]
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


