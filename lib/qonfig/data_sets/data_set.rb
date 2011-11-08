module Qonfig
  module DataSets
    class DataSet
      attr_accessor :data_source, :sortings, :formats

      def initialize(ext_params = {})
        params          = default_params.merge((ext_params||{}))

        @data_source    = set_data_source(params.delete(:data_source))
        add_sortings(params.delete(:sorting))
        add_formats(params.delete(:format))
      end

      def default_params
        {
          
        }
      end

      def get_format( ext_options = {} )
        options     = {}.merge(ext_options)

        formats.select{|f| f.match?( options )}
      end

      def set_data_source( data_source )
        @data_source = data_source
      end

      def add_sortings( sorting, ext_options = {} )
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

      def add_formats( formats, ext_options = {} )
        @formats ||= []

        options = default_add_formats_options.merge(ext_options||{})
        formats = [formats] unless Array.try_convert(formats)

        formats.each do |format|
          add_format(format, options)
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

      def add_format( format, ext_options = {} )
        options = ext_options || {}

        @formats << Formats::Format.new( format )
      end

      def serializable_hash
        {
          :data_source        => data_source,
          :sortings           => sortings.map{|s| s.serializable_hash}.delete_if{|k,v|v.blank?},
          :formats            => formats.map{|f| f.serializable_hash}.delete_if{|k,v|v.blank?}
        }.delete_if{|k,v|v.blank?}
      end
    end
  end
end