FactoryBot.define do
  factory :professional do
    association :user, factory: :user
    association :clinic, factory: :clinic

    cnpj { "12345678901234" }
    professional_record { "123456789" }
  end
end
