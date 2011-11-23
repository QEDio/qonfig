module Qonfig
  module DataSets
    module Formatings
      class Row < Base

        def initialize(ext_params = {})
          params             = default_params.merge(ext_params||{})

          super(params)
        end

        def default_params
          {

          }
        end
      end
    end
  end
end