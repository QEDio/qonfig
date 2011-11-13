FactoryGirl.define do
  factory :graph, :class => Qonfig::Analytics::Graph do
    sequence(:uuid) { |n| "uuid_#{n}" }
    sequence(:name) { |n| "name_#{n}" }
    sequence(:description) { |n| "description_#{n}" }
    sequence(:row_key) { |n| "row_key_#{n}" }
    sequence(:row_value) { |n| "row_value_#{n}" }
    sequence(:column_key) { |n| "column_key_#{n}" }
    sequence(:column_value) { |n| "column_value_#{n}" }

    #functions [create(:bollinger)]

  end
end
