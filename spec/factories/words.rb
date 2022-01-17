# frozen_string_literal: true

FactoryBot.define do
  factory :word, class: 'Word' do
    sequence(:id)
    word { Faker::Verb.base }
    count { rand(1..3) }
  end
end
