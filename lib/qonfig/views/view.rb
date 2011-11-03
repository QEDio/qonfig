module Qonfig
  module Views
    class View < Base
      attr_accessor   :partials

      def initialize(ext_params = {})
        params        = default_params.merge(ext_params)

        add_partials(params[:partials])
      end

      def default_params
        {
          :partials => {}
        }
      end

      def add_partials(partials, ext_options = {})
        options     = default_add_partials_options.merge(ext_options)

        Array(partials).each do |partial|
          add_partial(partial)
        end
      end

      def default_add_partials_options
        {
          
        }
      end

      def add_partial(partial, ext_options = {})
        options     = default_add_partial_options.merge(ext_options)

        if( partial.is_a?(Hash) )
          raise Exception.new("Need an uuid") if partial[:uuid].blank?
          @partials[partial[:uuid]] = Partial.new(partial)
        elsif( partial.is_a?(Partial) )
          @partials[partial.uuid] = partial
        end
      end

      def default_add_partial_options
        {
          
        }
      end
    end
  end
end