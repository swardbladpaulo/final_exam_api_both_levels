FactoryBot.define do
  factory :comment do
    body {"Hello there this is a comment"}
    association :article, factory: :article
  end
end
