FactoryGirl.define do
  factory :user, aliases: [:author] do
    email { FFaker::Internet.safe_email }
    password { FFaker::Internet.password }
    password_confirmation { password }
  end
end
