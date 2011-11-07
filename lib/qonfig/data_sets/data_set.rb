module Qonfig
  module DataSets
    class DataSet
      attr_accessor :data_source, :sorting, :format

      def initialize(ext_params = {})
        params          = default_params.merge((ext_params||{}))

        @data_source    = params[:data_source]
        @sorting        = params[:sorting]
        @format         = params[:format]
      end

      def default_params
        {

        }
      end

      def serializable_hash
        {
          :data_source        => data_source,
          :sorting            => sorting,
          :format             => format
        }.delete_if{|k,v|v.blank?}
      end
    end
  end
end