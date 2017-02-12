class Array
  def to_madoca2
    raise Madoca2::FormatError.new('madoca2のフォーマットではありません') unless self.map{|m| Madoca2::Message.new(m).complete?}.all?

    Madoca2::MessageRole.new self.map{|m| Madoca2::Message.new(m)}
  end
end
