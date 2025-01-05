
def roll_die
  rand(1..6) 
end

puts "Welcome to the Dice Roller Game!"
list = (1..12).to_a # Initialize the list of values


def check_game_status(list)
  if list.empty?
    puts "Congratulations! You removed all values and won the game!"
    return true
  end
  false
end

loop do
  # Roll two dice
  die1 = roll_die
  die2 = roll_die
  sum = die1 + die2
  puts "You rolled:"
  puts "Die 1: #{die1}"
  puts "Die 2: #{die2}"
  puts "Sum of dice: #{sum}"
  puts "Current list of values: #{list.join(', ')}"
  if list.include?(die1) || list.include?(die2) || list.include?(sum)
    puts "You can remove one or more values (Die 1: #{die1}, Die 2: #{die2}, Sum: #{sum})."
    puts "Enter the values to remove (separated by spaces):"
    responses = gets.chomp.split.map(&:to_i)
    if responses.all? { |val| list.include?(val) }
      responses.each { |val| list.delete(val) }
      puts "#{responses.join(', ')} removed successfully!"
    else
      puts "Invalid choice. One or more values are not in the list. You lost the game!"
      break
    end
  else
    puts "Neither dice values nor their sum are in the list. You lost the game!"
    break
  end
  break if check_game_status(list)
end
