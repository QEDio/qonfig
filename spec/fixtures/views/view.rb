module Qonfig
  module Test
    module Fixtures
      module Views
        module View
          include Qonfig::Test::Fixtures::Views::Partial

          VIEWS_VIEW_CONST              = "VIEWS_VIEW"
          VIEWS_VIEW_STR                = VIEWS_VIEW_CONST.downcase

          VIEWS_VIEW_UUID_1             = "#{VIEWS_VIEW_STR}_uuid"
          VIEWS_VIEW_NAME_1             = "#{VIEWS_VIEW_STR}_name"
          VIEWS_VIEW_DESCRIPTION_1      = "#{VIEWS_VIEW_STR}_description"
          VIEWS_VIEW_ORDER_1            = []

          VIEWS_VIEW_PARTIALS_1         = [VIEWS_PARTIAL_SERIALIZED_HASH_1, VIEWS_PARTIAL_SERIALIZED_HASH_2]
          
          VIEWS_VIEW_SERIALIZED_HASH_1 = {
            :uuid           => VIEWS_VIEW_UUID_1,
            :name           => VIEWS_VIEW_NAME_1,
            :description    => VIEWS_VIEW_DESCRIPTION_1,
            :order          => VIEWS_VIEW_ORDER_1,
            :partials       => VIEWS_VIEW_PARTIALS_1
          }
        end
      end
    end
  end
end