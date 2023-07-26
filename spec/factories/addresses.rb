FactoryBot.define do
  factory :address do
    country { "MyString" }
    city { "MyString" }
    street { "MyString" }
    postcode { "MyString" }
    delivery_time { "MyString" }
    User { nil }
  end
end
