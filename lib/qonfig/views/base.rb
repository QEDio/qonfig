require 'uuid'

module Qonfig
  module Views
    class Base
      attr_accessor :name, :description, :order
      attr_writer :uuid

      def initialize(ext_params = {})
        params          = default_params.merge(ext_params)

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
    end
  end
end