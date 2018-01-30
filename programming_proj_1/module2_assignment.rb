#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
  # Recall, attr_reader is essentially like a { get; private set; } in C# 
  attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number
  attr_reader :words_to_count_dictionary

  def initialize ( line_of_text, line_number)
    self.content = line_of_text
    self.line_number = line_number
    self.calculate_word_frequency
  end

  def calculate_word_frequency
    @words_to_count_dictionary = Hash.new(0)
    @content.split().each do |word|
      @words_to_count_dictionary[word.downcase] += 1
    end

    self.highest_wf_count = @words_to_count_dictionary.max_by{ |key, value| value}[1] # we want the value of the max kvp
    # found this on stack, but good to know hashes have a max_by attribute
    self.highest_wf_words = @words_to_count_dictionary.select{ |key, value| value == @highest_wf_count}.keys
  end

  def content= (line_of_text)
    @content = line_of_text
  end

  def line_number= (line_number)
    @line_number = line_number
  end

  def highest_wf_count= (count)
    # this is going to be a dictionary or whatever hash that goes word as the key to count being the string
    # then for the highest_wf_words we can just pick off the strings that have the highest value 
    # need to be careful about ones that are tied i guess
    # also we want to initialize it like this because we're just saying for the first time if we haven't seen 
    # anything and our hash is still nil then create this dictionary
    @highest_wf_count = count || -1
  end

  def highest_wf_words= (highest_wf_words)
    # just going to be a dictionary but now it's going to be selected to only contain the highest ones
    # seems dumb to have this when we could just modify the highest_wf_count but maybe I'm not understanding 
    # the implied data structures that they want me to use. Alright actually I'm pivoting to just have it be a list
    # of the max words. User can check the dictionary if they want to know the actual count.
    @highest_wf_words = highest_wf_words || []
  end
end

class Solution
  attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines

  def initialize
    self.analyzers = []
  end

  def analyze_file
    i = 0
    File.foreach( 'test.txt') do |line|
      @analyzers.push(LineAnalyzer.new(line, i))
      i += 1
    end
  end

  def calculate_line_with_highest_frequency
    self.highest_count_across_lines = self.analyzers.max { |lineAnalyzer| lineAnalyzer.highest_wf_count}.highest_wf_count
    self.highest_count_words_across_lines = self.analyzers.select { |lineAnalyzer| lineAnalyzer.highest_wf_count == self.highest_count_across_lines}
  end

  def print_highest_word_frequency_across_lines
    puts self.highest_count_words_across_lines.select { |lineAnalyzer| lineAnalyzer.highest_wf_words.keys}
  end

  def analyzers= (value)
    @analyzers = value
  end

  def highest_count_across_lines= (value)
    @highest_count_across_lines = value || -1
  end

  def highest_count_words_across_lines= (value)
    @highest_count_words_across_lines = value || []
  end
end
