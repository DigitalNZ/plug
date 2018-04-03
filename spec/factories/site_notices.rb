FactoryBot.define do
  factory :site_notice, class: '::Plug::SiteNotice' do
    name        'Awesome Site Notice'
    notice      'This is a notice'

    trait :invalid do
      name ''
    end
  end
end
