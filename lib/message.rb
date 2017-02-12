class Madoca2::Message < Struct.new("Struct", :verb, :object, :complement, :process, :pre_process, :post_process)
  ProcessSymbol = {0 => :process, 1 => :pre_process, 2 => :post_process}

  # 省略別名を設定
  alias :v    :verb
  alias :o    :object
  alias :c    :complement
  alias :proc :process
  alias :pre  :pre_process
  alias :post :post_process

  def initialize(hash)
    merge!(hash)
  end

  def get_vo
    {verb: self.verb, object: self.object}
  end

  def merge!(hash)
    hash.each do |key, val|
      self[key] = val
    end
  end

  def complete?
    self.map{|m| !m&.empty? }.all?
  end

  class << self
    # madoca2 V/O format
    def is_vo?(content)
      vo = get_vo(content)
      vo[:verb] && vo[:object]
    end

    # madoca2 V/O
    def get_vo(content)
      content.match(/^(\S.*)\/(.*)/)
      {verb: $1&.strip, object: $2&.strip}
    end

    # madoca2 C process pre_process post_process
    def get_cp(content, sym)
      tmp = content.split
      {:complement => tmp.shift, sym => tmp.join(' ')}
    end

    # madoca2 process pre_process post_process
    def get_p(content, sym)
      {sym => content.split.join(' ')}
    end
  end
end
