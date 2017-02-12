require_relative '../error'

module Madoca2
  class Parser
    class << self
      # 例外時にはnilを返す
      def parse(content)
        parse!(content) rescue nil
      end

      # 構文解析するフォーマットエラー時には例外を発生する
      def parse!(content)
        case content
          when Array
            parse_array(content)

          else
            raise Madoca2::NoMethodError.new( "#{self.to_s}.#{__callee__.to_s}(#{content.class.to_s}) is not allowed" )

        end
      end

      def parse_array(content)
        message_role = Madoca2::MessageRole.new
        process_cnt = 0
        last_vo = {}
        content.each do |line|
          if Madoca2::Message.is_vo?(line)
            last_vo = Madoca2::Message.get_vo(line)
            message_role << Madoca2::Message.new(last_vo)
            process_cnt = 0

          else
            if ( process_cnt % 3 ).zero?
              message_role << Madoca2::Message.new(last_vo) unless ( process_cnt.zero? )
              message_role.last.merge!(Madoca2::Message.get_cp(line, Madoca2::Message::ProcessSymbol[process_cnt % 3]))

            else
              message_role.last.merge!(Madoca2::Message.get_p(line, Madoca2::Message::ProcessSymbol[process_cnt % 3]))

            end

            process_cnt += 1
          end
        end

        raise Madoca2::ParseError.new('構文解析に失敗しました。') if message_role.fatal?

        message_role
      end
    end
  end
end
