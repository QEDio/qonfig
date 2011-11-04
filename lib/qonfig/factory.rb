module Qonfig
  class Factory
    def initialize
      raise Exception.new("Don't do this")
    end

    def self.build(data)
      if( data.is_a?( Hash ))
        Qonfig::Adapters::SerializableHash.build(:data => data)
      else
        raise Exception.new("Don't know how to handle #{data.class}")
      end
    end
  end
end