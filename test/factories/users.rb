FactoryBot.define do
  factory :user do
    first_name
    last_name
    password
    email
    avatar { generate :string }
  end
end
