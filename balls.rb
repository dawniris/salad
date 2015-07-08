require_relative 'salad.rb'

  print "TELL ME THE FUCKING KEY: "
  shift = gets.chomp.to_i

  print "ENCRYPT SOME GODDAMN SHIT: "
  msg = gets.chomp

  salad = SaladCypher.new(:msg => msg, :shift => shift)
  salad.cypher
  salad.reverse
  puts salad.transformation