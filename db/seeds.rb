# Add Categories
6.times do |n|
  name = Faker::Name.title
  description = Faker::Lorem.paragraphs(5).join("-")
  Category.create!(name: name,
                   description: description)
end

# Add Lessons
categories = Category.all
6.times do |n|
  name = "Lesson #{n + 1}"
  categories.each { |category| category.lessons.create!(name: name) }
end

# Add Words
lessons = Lesson.all
lessons.each do |lesson|
  6.times do |n|
    content = Faker::Lorem.word
    lesson.words.create!(content: content, category_id: lesson.category_id)
  end
end
