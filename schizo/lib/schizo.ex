defmodule Schizo do
  def uppercase(string) do
    transform_every_other_word(string, &uppercaser/1)
  end

  def unvowel(string) do
    transform_every_other_word(string, &unvowler/1)
  end

  def transform_every_other_word(string, transformation) do
    words = String.split(string)
    words_with_index = Stream.with_index(words)
    transformed_words = Enum.map(words_with_index, transformation)
    Enum.join(transformed_words, " ")
  end

  def uppercaser(input) do
    transformer(input, &String.upcase/1)
  end

  def unvowler(input) do
    transformer(input, fn(word) -> Regex.replace(~r([aeiou]), word, "") end)
  end

  def transformer({word, index}, transformation) do
    cond do
      rem(index, 2) == 0 -> word
      rem(index, 2) == 1 -> transformation.(word)
    end
  end
end
