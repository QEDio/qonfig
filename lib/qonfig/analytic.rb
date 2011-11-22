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

    def api
      @api ||= @datasource.get(  :user          => options[:user],
                                 :api           => "api")
    end

    def default_options
      {
        :datasource     => Qonfig::Db.new
      }
    end
  end
end