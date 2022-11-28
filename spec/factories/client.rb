FactoryBot.define do
  factory :client do
    association :user, factory: :user
    association :clinic, factory: :clinic

    cpf { "12345678901" }
    rg { "123456789" }
    birth_date { "1990-01-01" }
  end
end
