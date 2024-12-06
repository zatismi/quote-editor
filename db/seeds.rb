require 'faker'

puts "\n== Seeding the database with fixtures =="
system("bin/rails db:fixtures:load")

User.create!(company: Company.first, email: "asfgsa@asfasf.asf", password: "123123", password_confirmation: "123123")

# puts "slow"
# total = 10000
# progressbar = ProgressBar.create(total:)
# total.times do
#   progressbar.increment
#   Company.create!(name: Faker::Name.name)
# end

puts "fast!"
total = 10000
progressbar = ProgressBar.create(total:)
attributes = []
total.times do
  progressbar.increment
  attributes << { name: Faker::Name.name }
end

Company.insert_all attributes
