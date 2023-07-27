FactoryBot.define do
  factory :nutrition_profile do
    sex { "MyString" }
    age { 1 }
    height { 1 }
    weight { 1.5 }
    activity_level { "MyString" }
    health_goal { "MyString" }
    users { nil }
  end
end
