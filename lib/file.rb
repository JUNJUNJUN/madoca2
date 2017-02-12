require_relative 'parser'

module Madoca2
  class File
    COMMENT = '#'

    class << self
      def load(filename, opts={})
        # コメント行を除外して読み込み
        lines = ::File.readlines(filename, "\n", opts).reject{|line| line.match(/^#{COMMENT}|^\n/)}

        # 読み込んだ行を構文解析
        Madoca2::Parser.parse!(lines)
      end
    end
  end
end
