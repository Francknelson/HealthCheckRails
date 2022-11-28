FactoryBot.define do
  factory :clinic do
    association :user, factory: :user

    cnpj { "12345678901234" }
    corporate_name { "Clinica de Testes" }
    health_insurance { "SUS" }
  end
end
