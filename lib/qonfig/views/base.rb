require 'uuid'

module Qonfig
  module Views
    class Base
      attr_accessor :name, :description, :order
      attr_writer :uuid
      attr_reader :type

      def initialize(ext_params = {})
        params          = default_params.merge(ext_params)

        raise Exception.new("Need a type") if params[:type].nil?

        @type           = params[:type].to_s
        @uuid           = params[:uuid]
        @name           = params[:name]
        @description    = params[:description]
        @order          = params[:order]
      end

      def default_params
        {
          :order      => []
        }
      end

      def uuid
        @uuid ||= UUID.new().generate(:compact)
      end

      def serializable_hash
        {
          :uuid                 => uuid,
          :type                 => type,
          :name                 => name,
          :description          => description,
          :order                => order,
          :type                 => type
        }.delete_if{|k,v|v.nil?}
      end

      def eql?(other)
        if( other )
          return (serializable_hash == other.serializable_hash)
        end

        return false
      end

      def ==(other)
        eql?(other)
      end
    end
  end
end