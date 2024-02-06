FactoryBot.define do
  factory :user do
    fullname  { Faker::Name.name }
		email { Faker::Internet.email }
		user_type { User.user_types.keys.sample }
    avatar_image { Faker::LoremFlickr.image }
		password { "12345678" }
		password_confirmation { "12345678" }
  end
end
