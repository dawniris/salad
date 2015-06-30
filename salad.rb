require 'pry'
# require 'pry-byebug'
class SaladCypher
  attr_reader(:transformation, :shift)

  ALPHABET = (('a'..'z').to_a + ('A'..'Z').to_a).join

  # @shift =ARGV[0]

  def initialize
    print "TELL ME THE FUCKING KEY: "
    @shift = gets.chomp.to_i

    print "ENCRYPT SOME GODDAMN SHIT: "
    @msg = gets.chomp

    @transformation = ""
  end

  def cypher()
    @msg.each_char do |x|
      if ALPHABET.include?(x)
        @transformation += ALPHABET[ALPHABET.index(x) - @shift]
      else
        @transformation += x
      end
    end
    @transformation.downcase!
  end

  # def reverse()
  #   @transformation
  # end
end

  salad = SaladCypher.new
  salad.cypher()
  puts salad.transformation

#
##  8=====D~

  prints "blahblahbalh?"
  @response = gets.chomp

  if @response = Y
      -salad.shift
  end



