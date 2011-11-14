module Qonfig
  module DataSets
    module Sortings
      class Sorting
        attr_accessor :vertical, :horizontal

        def initialize(ext_params = {})
          params            = default_params.merge(ext_params||{})

          set_horizontal( params[:horizontal], params)
        end

        def default_params
          {

          }
        end

        def set_horizontal( horizontal, ext_options = {} )
          options           = default_set_horizontal_options.merge( ext_options )
          @horizontal       = Horizontal.new( horizontal )
        end

        def default_set_horizontal_options
          {
          
          }
        end

        def set_vertical( vertical, ext_options = {} )
          options           = default_set_vertical_options.merge( ext_options )
          @vertical         = Vertical.new( vertical )
        end

        def default_set_vertical_options
          {

          }
        end

        def serializable_hash
          {
            :horizontal     => horizontal.serializable_hash,
            :vertical       => vertical.serializable_hash
          }.delete_if{|k,v|v.blank?}
        end
      end
    end
  end
end