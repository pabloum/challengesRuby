

# module System
#   class Record
#
#   end
# end
#
# module Sales
#   class Record
#
#   end
# end
#
# system_record = System::Record.new
# sales_record = Sales::Record.new

module TextAnalyzer
  def num_words
    @body ? @body.split.size : 0
  end

  def num_chars
    @body ? @body.chars.size : 0
  end
end

class Article
  include TextAnalyzer
  attr_accessor :body
  def initialize (body)
    @body  = body
  end
end

class Comment
  include TextAnalyzer
  attr_accessor :body
  def initialize (body)
    @body  = body
  end
end


a1 = Article.new("Este es el cuerpo del artículo")
puts a1.num_words #=> 6
puts a1.num_chars #=> 30
