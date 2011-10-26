require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/object/blank'

module Qonfig
  class Analytics

    def initialize(ext_options = {})
      options             = default_options.merge(ext_options)

      raise Exception.new("No user provided!") if options[:user].blank?
      raise Exception.new("No view provided!") if options[:view].blank?
      
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
      row = bollinger["rows"][key] || {}

      # we need to compare with value as well
      # if it doesn't match, return nil
      if( row )
        row = row[value] || {}
      end
      
      return row
    end

    def bollinger_column(row_key, row_value, column_key, ext_options = {})
      options   = default_bollinger_column_options.merge(ext_options)
      row       = bollinger_row(row_key, row_value)
      column    = options[:default_return_value]
      value     = options[:column_value]

      if( row.present? && row["columns"] )
        column = row["columns"][column_key] || options[:default_return_value]

        if( column.present? && value && !column["value"].nil? )
          if( !value.eql?(column["value"]) )
            column = options[:default_return_value]
          end
        end
      end

      if( options[:merge_with_defaults] )
        column = (bollinger_defaults(:type => "columns", :key => column_key, :value => options[:column_value]) || {}).merge(column)
      end

      return column
    end

    def default_bollinger_column_options
      {
        :column_value         => nil,
        :merge_with_defaults  => true,
        :default_return_value => {}
      }
    end

    def bollinger_defaults(ext_options = {})
      options   = default_bollinger_defaults_options.merge(ext_options)

      default   = bollinger["defaults"] || options[:default_return_value]

      if( default.present? && options[:type] )
        default = default[options[:type]] || options[:default_return_value]
      end

      if( default.present? && options[:key] )
        default = default[options[:key]] || options[:default_return_value]
      end

      if( default.present? && options[:value] && !default["value"].nil? )
        if( !options[:value].eql?(default["value"]))
          default = options[:default_return_value]
        end
      end

      return default
    end

    def default_bollinger_defaults_options
      {
        :type                 => nil,
        :key                  => nil,
        :value                => nil,
        :default_return_value => {}
      }
    end

    def set_bollinger_default(type, key, ext_options = {})
      raise Exception.new("type is not allowed to be nil") if type.nil?
      raise Exception.new("key is not allowed to be nil") if key.nil?

      options = default_set_bollinger_defaults_options.merge(ext_options)
      default = bollinger_defaults(:type => type, :key => key, :value => options[:value])

      if( default.blank? )
        default = bollinger_defaults(:type => type)
        hsh = {}
        
        self.class.bollinger_params.each do |param|
          if( options[param] )
            hsh[param] = options[param]
          end
        end

        default[key] = hsh
      else
        self.class.bollinger_params.each do |param|
          if( options[param] )
            default[param] = options[param]
          end
        end
      end
    end

    def default_set_bollinger_defaults_options
      {
        :value => nil,
      }
    end

    def self.bollinger_params
      ["factor", "nr_values", "data_points"]
    end
  end
end