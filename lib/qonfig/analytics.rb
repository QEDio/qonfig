require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/object/blank'

module Qonfig
  class Analytics

    def initialize(ext_options = {})
      options             = default_options.merge(ext_options)

      raise Exception.new("Now user provided!") if options[:user].blank?
      raise Exception.new("Now view provided!") if options[:view].blank?
      
      @database           = options[:database]
      @analytics          = @database.get(  :user         => options[:user],
                                            :view         => options[:view],
                                            :function     => :analytics)
    end

    def default_options
      {
        :database     => Qonfig::Db.new
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

    def bollinger_column(row_key, row_value, column_key, column_value = nil)
      br        = bollinger_row(row_key, row_value)
      ret_val   = nil

      if( br && br[:columns] )
        br[:columns].each do |column|
          if( column_value.nil? )
            ret_val = column if column[:key].eql?(column_key)
          else
            ret_val = column if( column[:key].eql?(column_key) && column[:value].eql?(column_value))
          end
        end
      end

      return ret_val
    end

    def bollinger_defaults(type, key, value = nil)
      defaults = bollinger[:defaults][type]

      defaults.each do |default|
        if(value)
          return default if( default[:key].eql?(key) && default[:value].eql?(value))
        else
          return default if( default[:Key].eql?(key) )
        end
      end
    end
  end
end