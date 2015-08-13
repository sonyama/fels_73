# Add Categories
100.times do |n|
	name = Faker::Name.title
	description = Faker::Lorem.paragraphs(5).join("-")
	Category.create!(name: name,
									 description: description)
end
