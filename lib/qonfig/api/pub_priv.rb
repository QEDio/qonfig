module Qonfig
  module Api
    class PubPriv
      attr_accessor :public_key, :private_key
      
      def initialize( ext_params = {} )
        params        = default_params.merge(ext_params)

        @public_key      = params[:public_key]
        @private_key     = params[:private_key]
      end

      def default_params
        {

        }
      end
    end
  end
end