require_relative 'lib/film'

# «Фильм на вечер»
# Помните игру «Кто это снял?». Давайте с использованием тех же фильмов и того же класса Film сделаем ещё одну полезную программу:
# Напишите программу, которая считывает фильмы из папки data (или data/films), каждый фильм представлен в виде одного текстового файла в формате:
# Название фильма
# Режиссер
# Год выхода
# Программа должна выводить список режиссеров (если у двух фильмов 1 режиссер, то, конечно, этот режиссер должен появиться только 1 раз) и спрашивать у пользователя, фильм какого режиссера он хочет посмотреть.
# Потом программа должна советовать случайный фильм выбранного режиссера.

if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

all_files = Dir[File.join(__dir__, 'data', 'films', '*.txt')]

puts 'Приветствую, мой друг :)'
puts

films =
  all_files.map do |file|
    lines = File.readlines(file, encoding: 'UTF-8', chomp: true)
    Film.new(lines[0], lines[1], lines[2])
  end

directors = films.map { |film| film.director }.uniq

directors.each.with_index(1) do |director, index|
  puts "#{index}. #{director}"
end

puts 'Фильм какого режиссера вы хотите посмотреть сегодня?'
puts
user_choice = STDIN.gets.to_i

chosen_director = directors[user_choice - 1]

films_by_director = films.select { |film| film.director == chosen_director }

film_tonight = films_by_director.sample
puts
puts 'И сегодня вечером рекомендую посмотреть:'
puts  film_tonight
