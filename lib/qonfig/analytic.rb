# -*- encoding: utf-8 -*-
require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/object/blank'

module Qonfig
  class Analytic
    attr_accessor :analytics

    def initialize(ext_options = {})
      options             = default_options.merge(ext_options)

      raise Exception.new("No user provided!") if options[:user].blank?
      raise Exception.new("No view provided!") if options[:view].blank?
      
      @datasource           = options[:datasource]
      @analytics            = @datasource.get(  :user         => options[:user],
                                                :view         => options[:view])
    end

    def default_options
      {
        :datasource     => Qonfig::Db.new
      }
    end

  #  def bollinger
  #    @analytics["bollinger"]
  #  end
  #
  #  def bollinger_row(key, value)
  #    row = bollinger["rows"][key] || {}
  #
  #    # we need to compare with value as well
  #    # if it doesn't match, return nil
  #    if( row )
  #      row = row[value] || {}
  #    end
  #
  #    return row
  #  end
  #
  #  def bollinger_column(row_key, row_value, column_key, ext_options = {})
  #    options               = default_bollinger_column_options.merge(ext_options)
  #    merge_with_defaults   = options.delete(:merge_with_defaults)
  #    column = get_bollinger_column(row_key, row_value, column_key, options)
  #
  #    if( merge_with_defaults )
  #      default = bollinger_defaults(:type => "columns", :key => column_key, :value => options[:column_value]) || {}
  #
  #      if default.present?
  #        # takes care of everything not in column
  #        column = default.merge(column)
  #
  #        column.each_pair do |k,v|
  #          if( default.key?(k) )
  #            column[k] = default[k].merge(column[k])
  #          end
  #        end
  #      end
  #    end
  #
  #    return column
  #  end
  #
  #  def default_bollinger_column_options
  #    {
  #      :merge_with_defaults  => true
  #    }
  #  end
  #
  #  def get_bollinger_column(row_key, row_value, column_key, ext_options = {})
  #    options   = default_get_bollinger_column_options.merge(ext_options)
  #
  #    row       = bollinger_row(row_key, row_value)
  #    column    = options[:default_return_value]
  #    value     = options[:column_value]
  #
  #    if( row.present? && row["columns"] )
  #      column = row["columns"][column_key] || options[:default_return_value]
  #
  #      if( column.present? && value && !column["value"].nil? )
  #        if( !value.eql?(column["value"]) )
  #          column = options[:default_return_value]
  #        end
  #      end
  #    end
  #
  #    return column
  #  end
  #
  #  def default_get_bollinger_column_options
  #    {
  #      :column_value         => nil,
  #      :default_return_value => {}
  #    }
  #  end
  #
  #  def set_bollinger_column(row_key, row_value, column_key, data, ext_options = {})
  #    options   = default_set_bollinger_column_options.merge(ext_options)
  #    default   = bollinger_defaults(:type => "columns", :key => column_key, :value => options[:column_value])
  #
  #    data = self.class.remove_defaults(data, default)
  #    column = get_bollinger_column(row_key, row_value, column_key, options)
  #
  #    if( column.present? )
  #      column.replace(data)
  #    else
  #      row = bollinger_row(row_key, row_value)
  #      row["columns"] ||= {}
  #      row["columns"][column_key ] ||= {}.merge(data)
  #    end
  #  end
  #
  #  def default_set_bollinger_column_options
  #    {
  #
  #    }
  #  end
  #
  #  def bollinger_defaults(ext_options = {})
  #    options   = default_bollinger_defaults_options.merge(ext_options)
  #
  #    default   = bollinger["defaults"] || options[:default_return_value]
  #
  #    if( default.present? && options[:type] )
  #      default = default[options[:type]] || options[:default_return_value]
  #    end
  #
  #    if( default.present? && options[:key] )
  #      default = default[options[:key]] || options[:default_return_value]
  #    end
  #
  #    if( default.present? && options[:value] && !default["value"].nil? )
  #      if( !options[:value].eql?(default["value"]))
  #        default = options[:default_return_value]
  #      end
  #    end
  #
  #    return default
  #  end
  #
  #  def default_bollinger_defaults_options
  #    {
  #      :type                 => nil,
  #      :key                  => nil,
  #      :value                => nil,
  #      :default_return_value => {}
  #    }
  #  end
  #
  #  def set_bollinger_default(type, key, ext_options = {})
  #    raise Exception.new("type is not allowed to be nil") if type.nil?
  #    raise Exception.new("key is not allowed to be nil") if key.nil?
  #
  #    options = default_set_bollinger_defaults_options.merge(ext_options)
  #    default = bollinger_defaults(:type => type, :key => key, :value => options.delete(:value))
  #
  #    if( default.blank? )
  #      default = bollinger_defaults(:type => type)
  #      hsh = {}
  #
  #      options.each_pair do |band, conf|
  #        int_hsh = {}
  #
  #        self.class.bollinger_params.each do |param|
  #          if( conf[param] )
  #            int_hsh[param] = conf[param]
  #          end
  #        end
  #
  #        hsh[band] = int_hsh
  #      end
  #
  #      default[key] = hsh
  #    else
  #      self.class.bollinger_params.each do |param|
  #        options.each_pair do |band, params|
  #          if( params[param] )
  #            default[band] ||= {}
  #            default[band][param] = params[param]
  #          end
  #        end
  #      end
  #    end
  #  end
  #
  #  def default_set_bollinger_defaults_options
  #    {
  #      :value => nil,
  #    }
  #  end
  #
  #  def self.bollinger_params
  #    ["factor", "nr_values", "data_points"]
  #  end
  #
  #  def self.remove_defaults(column_config, column_defaults)
  #    column_defaults.each_pair do |id, def_conf|
  #      conf = column_config[id]
  #
  #      if( conf )
  #        conf.select!{ |var, val| !def_conf[var].eql?(val) }
  #      end
  #    end
  #
  #    return column_config.select{ |k,v| v.present? }
  #  end
  end
end