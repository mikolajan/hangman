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
      @letters.map { |letter| @user_guessed.include?(normalize_letter(letter)) ? letter : nil }
  end

  def word
    @letters.join
  end

  def play!(letter)
    letter = normalize_letter(letter)
    @user_guessed << letter if !over? && !@user_guessed.include?(letter)
  end

  def normalize_letter(letter)
    return 'Е' if letter == 'Ё'
    return 'И' if letter == 'Й'
    letter
  end

  def normilized_letters
    @letters.map { |letter| normalize_letter(letter) }
  end

  def lost?
    error_allowed == 0
  end

  def won?
    (normilized_letters - @user_guessed).empty?
  end

  def over?
    won? || lost?
  end
end
