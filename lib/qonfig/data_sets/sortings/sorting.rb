module Qonfig
  module DataSets
    module Sortings
      class Sorting
        def initialize(ext_params = {})
          params            = default_params.merge(ext_params||{})
        end

        def default_params
          {

          }
        end

        def serializable_hash
          {

          }.delete_if{|k,v|v.blank?}
        end
      end
    end
  end
end