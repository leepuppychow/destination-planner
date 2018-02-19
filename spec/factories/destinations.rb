FactoryBot.define do
  factory :destination do
    name "Denver"
    zip "80241"
    description "Good ol Denver"
    image_url Faker::Placeholdit.image
  end
end
