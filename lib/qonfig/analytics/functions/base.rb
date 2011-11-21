# -*- encoding: utf-8 -*-
require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/object/blank'
require 'qonfig/modules/id'

module Qonfig
  module Analytics
    module Functions
      class Base
        include Qonfig::Modules::Id

        attr_accessor     :color, :periodicity, :name, :external_data, :above, :below, :with_color
        attr_reader       :type
        attr_reader       :configurable_attributes

        def initialize( ext_params = {} )
          params = default_params.merge(ext_params)

          raise Exception.new("Need a type") if params[:type].nil?

          @uuid                         = params[:uuid]
          @type                         = params[:type].to_s
          @color                        = params[:color]
          @periodicity                  = params[:periodicity]
          @name                         = params[:name]
          @configurable_attributes      = params[:configurable_attributes]
          @above                        = params[:above]
          @below                        = params[:below]
          @with_color                   = params[:with_color]
          self.keys                     = params[:keys]
        end

        def default_params
          {
            :color                        => nil,
            :periodicity                  => nil,
            :name                         => nil,
            :configurable_attributes      => [],
            :external_data                => {},
            :with_color                   => true
          }
        end

        def serializable_hash
          {
            :uuid                       => uuid,
            :type                       => type,
            :color                      => color,
            :periodicity                => periodicity,
            :name                       => name,
            :configurable_attributes    => configurable_attributes,
            :external_data              => external_data,
            :above                      => above,
            :below                      => below,
            :with_color                 => with_color,
            :keys                       => keys
          }.delete_if{|k,v|v.blank?}
        end

        def eql?(other)
          serializable_hash == other.serializable_hash
        end

        def ==(other)
          eql?(other)
        end
      end
    end
  end
end