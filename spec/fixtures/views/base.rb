module Qonfig
  module Test
    module Fixtures
      module Views
        module Base
          VIEWS_BASE_CONST               = "VIEWS_BASE"
          VIEWS_BASE_STR                 = VIEWS_BASE_CONST.downcase

          VIEWS_BASE_UUID                = "#{VIEWS_BASE_STR}_uuid"
          VIEWS_BASE_NAME                = "#{VIEWS_BASE_STR}_name"
          VIEWS_BASE_DESCRIPTION         = "#{VIEWS_BASE_STR}_description"
          VIEWS_BASE_ORDER               = []
        end
      end
    end
  end
end