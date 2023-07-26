FactoryBot.define do
  factory :order do
    user_rating { 1 }
    user_feedback { "MyString" }
    users { nil }
  end
end
