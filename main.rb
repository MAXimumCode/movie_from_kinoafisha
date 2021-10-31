# Игра <<Какой фильм посмотреть?>>
require_relative 'lib/movie_site_parser'

puts 'Программа фильм на вечер c киноафиши'
puts
puts 'Грузим фильмы...'
puts

movies = MoviesSiteParser.load_from_kinoafisha

movies.directors_for_output.each_with_index do |director, index|
  puts "#{index + 1}. #{director}"
end

puts 'Фильм какого режиссера вы хотите сегодня посмотреть?'
user_choice = 0

until user_choice.between?(1, movies.directors_for_output.size)
  puts 'Укажите номер из списка:'
  puts
  user_choice = gets.to_i
end

puts 'И сегодня вечером рекомендую посмотреть:'
puts

puts movies.select_by_choice(user_choice).sample
