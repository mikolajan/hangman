class Game
  TOTAL_ERRORS_ALLOWED = 7

  def initialize(word)
    @letters = word.chars
    @user_guessed = []
  end

  def errors
    @user_guessed - normilized_letters
  end

  def error_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  def errors_made
    errors.length
  end

  def letters_to_guess
    result =
      @letters.map do |letter|
        if @user_guessed.include?(normalize_letter(letter))
          letter
        else
          nil
        end
      end

      result
  end

  def word
    @letters.join
  end

  def play!(letter)
    letter = normalize_letter(letter)

    if !over? && !@user_guessed.include?(letter)
      @user_guessed << letter
    end
  end

  def normalize_letter(letter)
    result =
      if letter == 'Ё'
        'Е'
      elsif letter == 'Й'
        'И'
      else
        letter
      end

    result
  end

  def normilized_letters
    @letterse.map { |letter| normalize_letter(letter) }
  end

  def lost?
    error_allowed == 0
  end

  def won?
    (normilize_letters - @user_guessed).empty?
  end

  def over?
    won? || lost?
  end
end
