module Qonfig
  module Test
    module Fixtures
      module Views
        module Base
          VIEW_BASE_CONST               = "VIEW_BASE"
          VIEW_BASE_STR                 = VIEW_BASE_CONST.downcase

          VIEW_BASE_UUID                = "#{VIEW_BASE_STR}_uuid"
          VIEW_BASE_NAME                = "#{VIEW_BASE_STR}_name"
          VIEW_BASE_DESCRIPTION         = "#{VIEW_BASE_STR}_description"
          VIEW_BASE_ORDER               = []
        end
      end
    end
  end
end