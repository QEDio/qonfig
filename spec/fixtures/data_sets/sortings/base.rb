module Qonfig
  module Test
    module Fixtures
      module DataSets
        module Sortings
          module Base
            SORTINGS_BASE_KEY                 = "sortings_base_column_key"
            SORTINGS_BASE_FUNCTIONS           = [{"lambda" => 'lambda{|n1,n2| n2 <=> n1}'}]
          end
        end
      end
    end
  end
end