FactoryBot.define do
  factory :address do
    association :user, factory: :user

    zipcode { "85812-030" }
    street { "Rua João de Barro" }
    number { "1333" }
    neighborhood { "Centro" }
    city { "Cascavel" }
    state { "PR" }
  end
end
