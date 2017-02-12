class Hash
  # madoca2スタイルへの変換
  def to_madoca2
    raise Madoca2::FormatError.new('madoca2のフォーマットではありません') unless Madoca2::Message.new(self).complete?

    Madoca2::MessageRole.new(self)
  end
end
