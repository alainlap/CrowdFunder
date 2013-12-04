# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

6.times do
  User.create(
  username: Faker::Internet.user_name,
  email: Faker::Internet.safe_email,
  password: 'password',
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  street_address: Faker::Address.building_number + " " + Faker::Address.street_name,
  city: Faker::Address.city,
  province: Faker::Address.state,
  postal_code: Faker::Address.zip_code,
  phone_number: Faker::PhoneNumber.cell_phone
  )
end

User.all.each { |u| u.activate! }

width = [970, 971, 972, 973, 974, 975, 976, 977, 978, 979]

15.times do
  img_width = width.sample.to_s
  Project.create(
  name: Faker::Commerce.product_name,
  goal: Faker::Number.number(3),
  description: Faker::Lorem.paragraphs(6).join('\n'),
  img: "http://placekitten.com/#{img_width}/600",
  end_date: Date.new(2015,1,1),
  min_pledge: 1,
  website: Faker::Internet.url,
  summary: Faker::Company.bs,
  creator_id: User.all.sample.id
  )
end

quant = [1, 2, 3, 4, 5, 6]
threshold = [100, 200, 500, 1000, 2000, 5000, 10000]

50.times do 
  Tier.create(
  project_id: Project.all.sample.id,
  initial_quantity: quant.sample,
  threshold: threshold.sample,
  reward_text: Faker::Company.bs + " and " + Faker::Company.bs + " and " + Faker::Company.bs
  )
end