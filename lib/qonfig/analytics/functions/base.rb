# -*- encoding: utf-8 -*-
require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/object/blank'
require 'uuid'

module Qonfig
  module Analytics
    module Functions
      class Base
        attr_accessor     :color, :periodicity, :name
        attr_writer       :uuid
        attr_reader       :type
        attr_reader       :configurable_attributes
        attr_accessor     :external_data

        def initialize( ext_params = {} )
          params = default_params.merge(ext_params)

          raise Exception.new("Need a type") if params[:type].nil?

          @uuid                         = params[:uuid]
          @type                         = params[:type].to_s
          @color                        = params[:color]
          @periodicity                  = params[:periodicity]
          @name                         = params[:name]
          @configurable_attributes      = params[:configurable_attributes]

        end

        def default_params
          {
            :color                        => nil,
            :periodicity                  => nil,
            :name                         => nil,
            :configurable_attributes      => [],
            :external_data                => {}
          }
        end

        def uuid
          @uuid ||= UUID.new.generate(:compact)
        end

        def serializable_hash
          {
            :uuid                       => uuid,
            :type                       => type,
            :color                      => color,
            :periodicity                => periodicity,
            :name                       => name,
            :configurable_attributes    => configurable_attributes,
            :external_data              => external_data
          }
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