module Qonfig
  module Views
    class View < Base
      attr_accessor   :partials

      TYPE        = "Qonfig::Views::View"

      def initialize(ext_params = {})
        params        = default_params_weak.merge(ext_params).merge(default_params_strong)

        @partials = {}
        add_partials(params.delete(:partials))

        super(params)
      end

      def default_params_weak
        {
          :partials => []
        }
      end

      def default_params_strong
        {
          :type     => TYPE
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

      def serializable_hash
        super.merge({
          :partials           => serializable_partials
        }).delete_if{|k,v|v.nil?}
      end

      def serializable_partials
        @partials.map{|k,v| v.serializable_hash }
      end
    end
  end
end