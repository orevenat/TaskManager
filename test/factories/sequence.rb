FactoryBot.define do
  sequence :string, aliases: [:first_name, :last_name, :password, :avatar, :name] do |n|
    "string#{n}"
  end

  sequence :description do |n|
    "long long description long long description long long description long long description #{n}"
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end
end
