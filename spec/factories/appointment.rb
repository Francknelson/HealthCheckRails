FactoryBot.define do
  factory :appointment do
    association :client, factory: :client
    association :professional, factory: :professional
    association :clinic, factory: :clinic

    appointment_date { "2020-01-01 10:00:00" }
    status { "Pendente" }
  end
end
