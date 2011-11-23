module Qonfig
  module DataSets
    class DataSet
      attr_accessor :data_source, :sortings, :formatings

      def initialize(ext_params = {})
        params          = default_params.merge((ext_params||{}))

        @data_source    = set_data_source(params.delete(:data_source))
        add_sortings(params.delete(:sortings))
        add_formatings(params.delete(:formatings))
      end

      def default_params
        {
          
        }
      end

      def get_format( ext_options = {} )
        options     = default_get_format_options.merge(ext_options||{})

        fs = formats.select{|f| f.match?( options )}

        if( options[:return_first] )
          fs = fs.first
        end

        return fs
      end

      def default_get_format_options
        {
          :return_first     => true
        }
      end

      def set_data_source( data_source )
        @data_source = data_source
      end

      def add_sortings( sortings, ext_options = {} )
        @sortings ||= []

        options = default_add_sortings_options.merge(ext_options||{})
        sortings = [sortings] unless Array.try_convert(sortings)

        sortings.each do |sorting|
          add_sorting(sorting, options)
        end
      end

      def default_add_sortings_options
        {

        }
      end

      def add_formatings( formatings, ext_options = {} )
        @formatings ||= []

        options = default_add_formats_options.merge(ext_options||{})
        formatings = [formatings] unless Array.try_convert(formatings)

        formatings.each do |formating|
          add_formating(formating, options)
        end
      end

      def default_add_formats_options
        {

        }
      end

      def add_sorting( sorting, ext_options = {} )
        options = ext_options || {}

        @sortings << Sortings::Sorting.new( sorting )

      end

      def add_formating( format, ext_options = {} )
        options = ext_options || {}

        @formatings << Formatings::Format.new( format )
      end

      def serializable_hash
        {
          :data_source        => data_source,
          :sortings           => sortings.map{|s| s.serializable_hash}.delete_if{|k,v|v.blank?},
          :formatings         => formatings.map{|f| f.serializable_hash}.delete_if{|k,v|v.blank?}
        }.delete_if{|k,v|v.blank?}
      end
    end
  end
end