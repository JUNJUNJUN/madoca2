module Madoca2
  class MessageRole < Array

    def initialize(array=[])
      super
    end

    def fatal?
      self.find{|message| !message.complete? }
    end

    def to_h
      self.map{|a| a.to_h}
    end
  end
end