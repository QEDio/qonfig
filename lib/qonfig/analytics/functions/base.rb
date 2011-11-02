module Qonfig
  module Analytics
    module Functions
      class Base
        attr_reader       :type
        attr_accessor     :color
        attr_accessor     :periodicity

        def initialize( ext_params = {} )
          params = ext_params

          raise Exception.new("Need a type") if params[:type].nil?
          @type     = params[:type]
        end
      end
    end
  end
end