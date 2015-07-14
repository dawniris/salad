require_relative 'salad.rb'

  print "TELL ME THE FUCKING KEY: "
  shift = gets.chomp.to_i

  print "ENCRYPT SOME GODDAMN SHIT: "
  msg = gets.chomp

  salad = SaladCypher.new(:msg => msg, :shift => shift)
  salad.cypher
  puts salad.transformation

  print "REGERTS? y/n "
  crap = gets.chomp

  if crap == 'y'
    salad.reverse
    puts salad.transformation
  end

