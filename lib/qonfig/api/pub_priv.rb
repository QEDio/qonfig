module Qonfig
  module Api
    class PubPriv
      def initialize( ext_params = {} )
        params        = default_params.merge(ext_params)

        @pub_key      = params[:pub_key]
        @priv_key     = params[:priv_key]
      end

      def default_params
        {

        }
      end
    end
  end
end