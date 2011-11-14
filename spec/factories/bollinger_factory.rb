FactoryGirl.define do
  factory :bollinger, :class => Qonfig::Analytics::Functions::Bollinger do
    sequence(:uuid) { |n| "uuid_#{n}" }
    sequence(:name) { |n| "name #{n}" }
    sequence(:deviation_factor) { |n| n }
    sequence(:number_of_values_moving_average) { |n| n+1 }
    deviation_type        "sd"
    periodicity           "daily"
    color                 "#ff0000"
  end
end