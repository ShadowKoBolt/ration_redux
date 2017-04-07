FactoryGirl.define do
  factory :plan do
    user
    name { Faker::Lorem.sentence }

    transient do
      days_count 3
    end

    after(:create) do |plan, evaluator|
      create_list(:day, evaluator.days_count, plan: plan)
    end
  end
end
