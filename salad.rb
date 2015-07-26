require 'pry'

class SaladCypher
  attr_reader(:transformation, :shift, :string)

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
    @string = logic(@string || @msg, :method => 'rap')
  end

  def reverse
    @string = logic(@string || @msg, :method => 'reverse_rap')
  end

  def logic(word, method:)
    pasta = []
    word.each_char do |x|
      if ALPHABET.include?(x)
        pasta << ALPHABET[send(method, x, ALPHABET)] #stop asking this stupid 'how to switch method' question and remember fucking .send
      elsif OTHER_ALPHABET.include?(x)
        pasta << OTHER_ALPHABET[send(method, x, OTHER_ALPHABET)]
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



end

##  8=====D~


