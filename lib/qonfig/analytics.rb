require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/object/blank'

module Qonfig
  class Analytics

    def initialize(ext_options = {})
      options             = default_options.merge(ext_options)

      raise Exception.new("Now user provided!") if options[:user].blank?
      raise Exception.new("Now view provided!") if options[:view].blank?
      
      @datasource           = options[:datasource]
      @analytics            = @datasource.get(  :user         => options[:user],
                                                :view         => options[:view],
                                                :function     => "analytics")
    end

    def default_options
      {
        :datasource     => Qonfig::Db.new
      }
    end

    def bollinger
      @analytics["bollinger"]
    end

    def bollinger_row(key, value)
      row = bollinger["rows"][key]

      # we need to compare with value as well
      # if it doesn't match, return nil
      if( row )
        row = row[value]
      end
      
      return row
    end

    def bollinger_column(row_key, row_value, column_key, ext_options = {})
      options   = default_bollinger_column_options.merge(ext_options)
      row       = bollinger_row(row_key, row_value)
      column    = nil
      value     = options[:column_value]

      if( row && row["columns"] )
        column = row["columns"][column_key]
        if( column && value && !column["value"].nil? )
          if( !value.eql?(column["value"]) )
            column = nil
          end
        end
      end

      if( column )
        if( options[:merge_with_defaults] )
          column = (bollinger_defaults("columns", column_key, options[:column_value]) || {}).merge(column)
        end
      end

      return column
    end

    def default_bollinger_column_options
      {
        :column_value         => nil,
        :merge_with_defaults  => true
      }
    end

    def bollinger_defaults(type, key, value = nil)
      default   = nil
      defaults = bollinger["defaults"][type]

      if defaults
        default = defaults[key]

        if( default && value && !default["value"].nil? )
          if( !value.eql?(default["value"]))
            default = nil
          end
        end
      end

      return default
    end
  end
end