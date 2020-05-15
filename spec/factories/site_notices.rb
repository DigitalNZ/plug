FactoryBot.define do
  factory :site_notice, class: "::Plug::SiteNotice" do
    name "Awesome Site Notice"
    notice "This is a notice"
    theme "background:#CCC;color:#000;icon:info-circle"

    trait :invalid do
      name ""
    end

    trait :default do
      theme "background:#9D201F;color:#F2F2F2;icon:flag"
    end
  end
end
