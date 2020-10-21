## игра "Виселица". Версия 2.0.

Пользователь должен отгадать загаданное слово буква за буквой. Макисимальное число ошибок - 7, каждая неудачная попытка пририсовывает деталь изображения виселицы.
В данной версии буквы Й и Ё соответствуют буквам И и Е, но Ъ и Ь - это разные буквы.

### Программа написана на Ruby.
    
Для запуска игры, находясь в дирректории с игрой, в консоли введите:

    ruby main.rb

Слова для игры хранятся в /data/words.txt. Для изменения числа ошибок в /lib/game.rb измените значение константы TOTAL_ERRORS_ALLOWED, для отключения изображения виселицы закомментируйте 16-я строку в /lib/console_interface.rb

###### Пример запуска игры:
https://github.com/mikolajan/hangman/blob/images-for-README/game_example.jpg

     СЛОВО: __ А __ О __ Т __
               _______
              |/
              |     ( )
              |     _|_
              |    / | \\
              |      |
              |
              |
              |
            __|________
            |         |
    
    
    
    Ошибки (5): И, Е, Л, П, М
    У вас осталось ошибок: 2
    
    Введите следующую букву: К
