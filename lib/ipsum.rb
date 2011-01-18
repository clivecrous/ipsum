require 'ipsum/version'

class Ipsum

  MAX_CHUNKS = 10

  CHUNKS = [ %w|b c d f g h j k l m n p q r s t v w x y z st tr ch dr th sh gh|,
             %w|a e i o u ou ae ai| ]

  def self.word
    chunks = 1 + rand(4)
    chunks += 1 while chunks <= MAX_CHUNKS && rand(2) == 0

    chunkset_counter = chunks == 1 ? 1 : rand(2)

    word = ''

    chunks.times do
      chunkset = CHUNKS[ chunkset_counter % 2 ]
      chunkset_counter += 1
      word += chunkset[ rand( chunkset.length ) ]
    end

    word

  end

  def self.sentence( words = rand(5) + 3 )
    ( [ nil ] * words ).map{|n|self.word}.join(' ').capitalize + '.'
  end

  def self.sentences( amount = rand(5) + 3 )
    ( [ nil ] * amount ).map{|n|self.sentence}.join(' ')
  end

end
