# -*- encoding: utf-8 -*-
require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/object/blank'

module Qonfig
  module Adapters
    class SerializableHash
      def self.build(ext_params = {})
        params = ext_params
        raise Exception.new("No type provided in hsh. Don't know what to build'") if params[:type].nil?

        return params[:type].constantize.new(params)
      end
    end
  end
end