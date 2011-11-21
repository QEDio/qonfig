module Qonfig
  module DataSets
    module Formats
      class Format
        attr_accessor :row, :column

        def initialize(ext_params = {})
          params            = default_params.merge(ext_params||{})

          set_row(params[:row], params)
          set_column(params[:column], params)
        end

        def default_params
          {

          }
        end

        def set_row( row, ext_options )
          options     = default_set_row_options.merge(ext_options||{})
          @row        = Row.new( row )
        end

        def default_set_row_options
          {

          }
        end

        def set_column( column, ext_options )
          options     = default_set_column_options.merge(ext_options||{})
          @column     = Column.new( column )
        end

        def default_set_column_options
          {

          }
        end

        def match?( ext_options = {} )
          options             = default_match_options.merge(ext_options||{})

          row.match?(:key => options[:row_key], :value => options[:row_value]) &&
            column.match?( :key => options[:column_key], :value => options[:column_value] )
        end

        def default_match_options
          {

          }
        end

        def serializable_hash
          {
            :row        => row.serializable_hash,
            :column     => column.serializable_hash
          }.delete_if{|k,v|v.blank?}
        end
      end
    end
  end
end