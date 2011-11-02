module Qonfig
  module Analytics
    module Functions
      class Base
        attr_reader       :type
        attr_accessor     :id, :color, :periodicity, :name

        def initialize( ext_params = {} )
          params = default_params.merge(ext_params)

          raise Exception.new("Need a type") if params[:type].nil?

          @id           = params[:id]
          @type         = params[:type]
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

        def serializable_hash
          {
            :id           => id,
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