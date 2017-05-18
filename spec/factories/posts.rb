FactoryGirl.define do
  factory :post do
    title { FFaker::CheesyLingo.title }
    body { FFaker::CheesyLingo.sentence }
    author
  end
end
