require 'qonfig/api/database'
require 'qonfig/api/pub_priv'

module Qonfig
  module Api
    class Api
      attr_reader :pub_priv, :database
      
      def initialize( ext_params = {} )
        params              = default_params.merge(ext_params.delete_if{|k,v|v.nil?})
        self.pub_priv       = params[:pub_priv]
        self.database       = params[:database]
      end

      def default_params
        {
        }
      end

      def pub_priv=( options = {} )
        @pub_priv = PubPriv.new( options )
      end

      def database=( options = {} )
        @database = Database.new( options )
      end
    end
  end
end