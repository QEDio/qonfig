# -*- encoding: utf-8 -*-
require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/object/blank'

module Qonfig
  class Analytic
    def initialize(ext_params = {})
      params                  = default_params.merge(ext_params)

      raise Exception.new("No user provided!") if params[:user].blank?
      @user                   = params[:user]
      @datasource             = params[:datasource]
    end

    def default_params
      {
        :datasource     => Qonfig::Db.new
      }
    end

    def view(v)
      @analytics ||= @datasource.get( :user         => @user,
                                      :view         => v)
    end

    def api
      @api ||= @datasource.get(  :user          => @user,
                                 :api           => "api")
    end
  end
end