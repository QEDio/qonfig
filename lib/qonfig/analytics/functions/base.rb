require 'uuid'

module Qonfig
  module Analytics
    module Functions
      class Base
        attr_accessor     :color, :periodicity, :name
        attr_writer       :uuid
        attr_reader       :type

        def initialize( ext_params = {} )
          params = default_params.merge(ext_params)

          raise Exception.new("Need a type") if params[:type].nil?

          @uuid         = params[:uuid]
          @type         = params[:type].to_s
          @color        = params[:color]
          @periodicity  = params[:periodicity]
          @name         = params[:name]
        end

        def default_params
          {
            :color        => nil,
            :periodicity  => nil,
            :name         => nil
          }
        end

        def uuid
          @uuid ||= UUID.new.generate(:compact)
        end

        def serializable_hash
          {
            :uuid         => uuid,
            :type         => type,
            :color        => color,
            :periodicity  => periodicity,
            :name         => name
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