require 'active_support/concern'
require 'uuid'

module Qonfig
  module Modules
    module Id
      extend ActiveSupport::Concern

      module ClassMethods
      end

      module InstanceMethods
        attr_writer       :uuid

        def uuid
          @uuid ||= UUID.new.generate(:compact)
        end

        def keys
          @keys ||= {}

          return @keys
        end

        def add_keys=(k)
          return self if k.nil?
          raise Exception.new("K has to be a hash, but is #{k.class}, value: #{k.to_s}") unless k.is_a?(Hash)
          keys.merge(k)
        end

        def keys=(k)
          return self if k.nil?
          raise Exception.new("K has to be a hash, but is #{k.class}, value: #{k.to_s}") unless k.is_a?(Hash)
          @keys = k
        end

        def match?(k = {})
          k ||= {}
          raise Exception.new("K has to be a hash, but is #{k.class}, value: #{k.to_s}") unless k.is_a?(Hash)
          keys.eql?(k.delete_if{|kk,v|v.blank?})
        end
      end
    end
  end
end
