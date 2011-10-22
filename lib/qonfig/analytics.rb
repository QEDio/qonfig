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
                                                :function     => :analytics)
    end

    def default_options
      {
        :datasource     => Qonfig::Db.new
      }
    end

    def bollinger
      @analytics[:bollinger]
    end

    def bollinger_row(key, value)
      ret_val = nil

      bollinger[:rows].each do |row|
        if( row[:key].eql?(key) && row[:value].eql?(value) )
          ret_val = row
          break
        end
      end

      return ret_val
    end

    def bollinger_column(row_key, row_value, column_key, ext_options = {})
      options   = default_bollinger_column_options.merge(ext_options)
      br        = bollinger_row(row_key, row_value)
      ret_val   = nil

      if( br && br[:columns] )
        br[:columns].each do |column|
          if( options[:column_value].nil? || column[:value].nil? )
            ret_val = column if column[:key].eql?(column_key)
          else
            if( column[:key].eql?(column_key) && column[:value].eql?(options[:column_value]))
              ret_val = column
            end
          end
        end
      end

      if( options[:merge_with_defaults] )
        ret_val = (bollinger_defaults(:columns, column_key, options[:column_value]) || {}).merge(ret_val)
      end
      return ret_val
    end

    def default_bollinger_column_options
      {
        :column_value         => nil,
        :merge_with_defaults  => true
      }
    end

    def bollinger_defaults(type, key, value = nil)
      ret_val   = nil
      defaults = bollinger[:defaults][type]

      if defaults && defaults.is_a?(Array)
        defaults.each do |default|
          if(value && !default[:value].nil?)
            ret_val = default if( default[:key].eql?(key) && default[:value].eql?(value))
          else
            ret_val = default if( default[:key].eql?(key) )
          end
        end
      end

      return ret_val
    end
  end
end