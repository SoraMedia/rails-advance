FactoryBot.define do
  factory :event do
    title { "MyString" }
    description { "MyText" }
    held_on { "2026-01-31" }
    organizer_name { "MyString" }
    target_department { "MyString" }
  end
end
