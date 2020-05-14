FactoryBot.define do
  factory :feature, class: '::Plug::Feature' do
    name        { 'Awesome feature' }
    description { 'Awesome feature' }
    notice      { 'Notice :)' }

    trait :invalid do
      name { '' }
    end
  end
end
