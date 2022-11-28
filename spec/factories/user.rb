FactoryBot.define do
  factory :user do
    name { "José" }
    last_name { "Silva" }
    email { "jose@gmail.com" }
    password { "123456" }
    password_confirmation { "123456" }
    phone { "9966-4455" }
    user_type { "admin"}
  end
end
