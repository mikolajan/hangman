require 'colorize'

class ConsoleInterface
  FIGURES =
    Dir["#{__dir__}/../data/figures/*.txt"].
    sort.
    map { |file_name| File.read(file_name) }

  def initialize(game)
    @game = game
  end

  def print_out
    system "clear" or system "cls"

    hidden_word = "СЛОВО: #{word_to_show}"
    current_error = "Ошибки (#{@game.errors_made}): #{errors_to_show}"

    puts <<~EOF
      #{hidden_word.colorize(:blue)}
      #{figure.colorize(:yellow)}

      #{current_error.colorize(:red)}
      У вас осталось ошибок: #{@game.error_allowed}

    EOF

    if @game.won?
      puts "Поздравляем, вы выйграли!".colorize(:green)
    elsif @game.lost?
      puts "Вы проиграли, загаданное слово: #{@game.word}".colorize(:red)
    end
  end

  def figure
    FIGURES[@game.errors_made]
  end

  def word_to_show
      @game.letters_to_guess.map { |letter| letter == nil ? '__' : letter }.join(' ')
  end

  def errors_to_show
    @game.errors.join(', ')
  end

  def get_input
    print 'Введите следующую букву: '
    letter = gets[0].upcase
    letter
  end
end
