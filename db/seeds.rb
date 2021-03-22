# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

OneTimePayment.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(OneTimePayment.table_name)

User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(User.table_name)

Course.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(Course.table_name)

LearningPath.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(LearningPath.table_name)

Category.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(Category.table_name)

AllowlistedJwt.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(AllowlistedJwt.table_name)

ActiveRecord::Base.connection.reset_pk_sequence!(Chapter.table_name)
ActiveRecord::Base.connection.reset_pk_sequence!(Lesson.table_name)
ActiveRecord::Base.connection.reset_pk_sequence!(Subscription.table_name)
ActiveRecord::Base.connection.reset_pk_sequence!(Question.table_name)
ActiveRecord::Base.connection.reset_pk_sequence!(Answer.table_name)
ActiveRecord::Base.connection.reset_pk_sequence!(ProgressState.table_name)
ActiveRecord::Base.connection.reset_pk_sequence!(Comment.table_name)


#Admin

User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: 'admin@learning.com',
  password: 'bonjour',
  is_approved: true,
  is_reviewed: true,
  role: 'admin'
)

#Teacher

User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: 'teacher@learning.com',
  password: 'bonjour',
  is_approved: true,
  is_reviewed: true,
  role: 'teacher'
)

#Student

User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: 'student@learning.com',
  password: 'bonjour',
  is_approved: true,
  is_reviewed: true,
  role: 'student'
)

# ------- One user of each role approved -------

3.times do |student|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'fakerstudent',
    is_approved: true,
    is_reviewed: true,
    role: 'student'
  )
end

3.times do |student|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'fakerstudent',
    role: 'student'
  )
end

3.times do |teacher|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'fakerteacher',
    is_approved: true,
    is_reviewed: true,
    role: 'teacher'
  )
end

puts '-------------------- Users table --------------------'
tp User.all

# COURSES
Course.create(title: 'Build Your First Web Pages With HTML and CSS')
Course.create(title: 'Learn Programming With JavaScript')
Course.create(title: 'Learn About Agile Project Management and SCRUM')
Course.create(title: 'Speak in public')
Course.create(title: 'Manage Your Code Project With Git & Github')
Course.create(title: 'Learn about Lean Startup')
Course.create(title: 'Organize your data in a spreadsheet')
Course.create(title: 'Python is not a snake!')
Course.create(title: 'Python is still not a snake!')
Course.create(title: 'ruby on rails is awesome for creating new apps!')
Course.create(title: 'Start learning code with Javascript')
Course.create(title: 'Train your coding spirit with Code Wars')
Course.create(title: 'Javascript is good for you')

puts '-------------------- Courses table --------------------'
tp Course.all

# CATEGORIES
Category.create(title:'Business')
Category.create(title:'web developper')
Category.create(title:'Ruby')
Category.create(title:'Javascript')
Category.create(title: 'Python')
Category.create(title:'Coding')

# LEARNING PATHS
business =
  LearningPath.create(title: 'Start your own business', price_in_cents: 50_000)
business.courses << [
  Course.find_by(title: 'Speak in public'),
  Course.find_by(title: 'Learn about Lean Startup'),
  Course.find_by(title: 'Learn About Agile Project Management and SCRUM'),
  Course.find_by(title: 'Organize your data in a spreadsheet')
]
business.categories << [
  Category.find_by(title:'Business')
]

code =
  LearningPath.create(title: 'Become a web developer', price_in_cents: 80_000)
code.courses << [
  Course.find_by(title: 'Build Your First Web Pages With HTML and CSS'),
  Course.find_by(title: 'Learn Programming With JavaScript'),
  Course.find_by(title: 'Manage Your Code Project With Git & Github')
]
code.categories << [
  Category.find_by(title:'web developper')
]

#Solo courses, with learning pathes and categories
start =
  LearningPath.create(
    title: 'Get started with web development',
    price_in_cents: 10_000
  )
start.courses <<
  Course.find_by(title: 'Build Your First Web Pages With HTML and CSS')
start.categories << [
  Category.find_by(title: 'Coding') 
]

python =
  LearningPath.create(
    title: 'Get started with web Python',
    price_in_cents: 20_000
  )
python.courses <<
  Course.find_by(title: 'Python is not a snake!')
python.categories << [
  Category.find_by(title: 'Coding'),
  Category.find_by(title: 'Python')
]

pythonadv =
  LearningPath.create(
    title: 'Advanced Python',
    price_in_cents: 30_000
  )
pythonadv.courses <<
  Course.find_by(title: 'Python is still not a snake!')
pythonadv.categories << [
    Category.find_by(title: 'Coding'),
    Category.find_by(title: 'Python')
  ]

ruby =
  LearningPath.create(
    title: 'Ruby on rails',
    price_in_cents: 30_000
  )
ruby.courses <<
  Course.find_by(title: 'ruby on rails is awesome for creating new apps!')
ruby.categories << [
  Category.find_by(title: 'Coding'),
  Category.find_by(title: 'Ruby')
  ]

jsnoob =
  LearningPath.create(
    title: 'Javascript for noobs',
    price_in_cents: 5_000
  )
jsnoob.courses <<
  Course.find_by(title: 'Start learning code with Javascript')
jsnoob.categories << [
  Category.find_by(title: 'Coding'),
  Category.find_by(title: 'Javascript')
]

codewars =
  LearningPath.create(
    title: 'Code Wars for training',
    price_in_cents: 5_000
  )
codewars.courses <<
  Course.find_by(title: 'Train your coding spirit with Code Wars')
codewars.categories << [
  Category.find_by(title: 'Coding')
]

jsadv =
  LearningPath.create(
    title: 'Advanced Javascript',
    price_in_cents: 5_000
  )
jsadv.courses <<
  Course.find_by(title: 'Javascript is good for you')
jsadv.categories << [
  Category.find_by(title: 'Coding'),
  Category.find_by(title: 'Javascript')
]

puts '-------------------- Learning paths table --------------------'
tp LearningPath.all

#Chapters
webpage =
  Chapter.create(
    title: 'What is a web page',
    position: 1,
    course:
      Course.find_by(title: 'Build Your First Web Pages With HTML and CSS')
  )
html =
  Chapter.create(
    title: 'Html basics',
    position: 2,
    course:
      Course.find_by(title: 'Build Your First Web Pages With HTML and CSS')
  )
css =
  Chapter.create(
    title: 'Css basics',
    position: 3,
    course:
      Course.find_by(title: 'Build Your First Web Pages With HTML and CSS')
  )

puts '-------------------- Chapters paths table --------------------'
tp Chapter.all

#Lessons
Lesson.create(title: 'Historic',
  position: 1,
  chapter: webpage,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: "https://www.youtube.com/watch?v=i_dOaAqx6GU"
)
Comment.create(
  content: 'Hello everybody',
  lesson: Lesson.last,
  user: User.all.sample
)
Comment.create(
  content: 'How are you today',
  lesson: Lesson.last,
  user: User.all.sample
)
Question.create(
  lesson: Lesson.last,
  position: 1,
  content: Faker::TvShows::MichaelScott.quote,
  explanation: Faker::Lorem.sentence
)
3.times do
  Answer.create(
    question: Question.last,
    is_correct: false,
    content: Faker::Lorem.word
  )
end
Answer.create(
  question: Question.last,
  is_correct: true,
  content: Faker::Lorem.word
)
Lesson.create(title: 'Client and server',
  position: 2,
  chapter: webpage,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: "https://www.youtube.com/watch?v=i_dOaAqx6GU"
)
Comment.create(
  content: 'Hello everybody',
  lesson: Lesson.last,
  user: User.all.sample
)
Comment.create(
  content: 'How are you today',
  lesson: Lesson.last,
  user: User.all.sample
)
Question.create(
  lesson: Lesson.last,
  position: 1,
  content: Faker::TvShows::MichaelScott.quote,
  explanation: Faker::Lorem.sentence
)
4.times do
  Answer.create(
    question: Question.last,
    is_correct: [true, false].sample,
    content: Faker::Lorem.word,
  )
end

Lesson.create(title: 'What is a browser',
  position: 3,
  chapter: webpage,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: "https://www.youtube.com/watch?v=i_dOaAqx6GU"
)
Comment.create(
  content: 'Hello everybody',
  lesson: Lesson.last,
  user: User.all.sample
)
Comment.create(
  content: 'How are you today',
  lesson: Lesson.last,
  user: User.all.sample
)
Question.create(
  lesson: Lesson.last,
  position: 1,
  content: Faker::TvShows::MichaelScott.quote,
  explanation: Faker::Lorem.sentence
)
4.times do
  Answer.create(
    question: Question.last,
    is_correct: [true, false].sample,
    content: Faker::Lorem.word
  )
end

Lesson.create(title: 'Historic',
  position: 1,
  chapter: html,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: "https://www.youtube.com/watch?v=i_dOaAqx6GU"
)
Comment.create(
  content: 'Hello everybody',
  lesson: Lesson.last,
  user: User.all.sample
)
Comment.create(
  content: 'How are you today',
  lesson: Lesson.last,
  user: User.all.sample
)
Question.create(
  lesson: Lesson.last,
  position: 1,
  content: Faker::TvShows::MichaelScott.quote,
  explanation: Faker::Lorem.sentence
)
4.times do
  Answer.create(
    question: Question.last,
    is_correct: [true, false].sample,
    content: Faker::Lorem.word
  )
end

Lesson.create(title: 'Useful resources',
  position: 2,
  chapter: html,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: "https://www.youtube.com/watch?v=i_dOaAqx6GU"
)
Comment.create(
  content: 'Hello everybody',
  lesson: Lesson.last,
  user: User.all.sample
)
Comment.create(
  content: 'How are you today',
  lesson: Lesson.last,
  user: User.all.sample
)
Question.create(
  lesson: Lesson.last,
  position: 1,
  content: Faker::TvShows::MichaelScott.quote,
  explanation: Faker::Lorem.sentence
)
4.times do
  Answer.create(
    question: Question.last,
    is_correct: [true, false].sample,
    content: Faker::Lorem.word
  )
end

Lesson.create(title: 'How to organize your page',
  position: 3,
  chapter: html,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: "https://www.youtube.com/watch?v=i_dOaAqx6GU"
)
Comment.create(
  content: 'Hello everybody',
  lesson: Lesson.last,
  user: User.all.sample
)
Comment.create(
  content: 'How are you today',
  lesson: Lesson.last,
  user: User.all.sample
)
Question.create(
  lesson: Lesson.last,
  position: 1,
  content: Faker::TvShows::MichaelScott.quote,
  explanation: Faker::Lorem.sentence
)
4.times do
  Answer.create(
    question: Question.last,
    is_correct: [true, false].sample,
    content: Faker::Lorem.word
  )
end

Lesson.create(title: 'Historic',
  position: 1,
  chapter: css,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: "https://www.youtube.com/watch?v=i_dOaAqx6GU"
)
Comment.create(
  content: 'Hello everybody',
  lesson: Lesson.last,
  user: User.all.sample
)
Comment.create(
  content: 'How are you today',
  lesson: Lesson.last,
  user: User.all.sample
)
Question.create(
  lesson: Lesson.last,
  position: 1,
  content: Faker::TvShows::MichaelScott.quote,
  explanation: Faker::Lorem.sentence
)
4.times do
  Answer.create(
    question: Question.last,
    is_correct: [true, false].sample,
    content: Faker::Lorem.word
  )
end

Lesson.create(title: 'Colors and font',
  position: 2,
  chapter: css,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: "https://www.youtube.com/watch?v=i_dOaAqx6GU"
)
Comment.create(
  content: 'Hello everybody',
  lesson: Lesson.last,
  user: User.all.sample
)
Comment.create(
  content: 'How are you today',
  lesson: Lesson.last,
  user: User.all.sample
)
Question.create(
  lesson: Lesson.last,
  position: 1,
  content: Faker::TvShows::MichaelScott.quote,
  explanation: Faker::Lorem.sentence
)
4.times do
  Answer.create(
    question: Question.last,
    is_correct: [true, false].sample,
    content: Faker::Lorem.word
  )
end

Lesson.create(title: 'Proper indentation',
  position: 3,
  chapter: css,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: "https://www.youtube.com/watch?v=i_dOaAqx6GU"
)
Comment.create(
  content: 'Hello everybody',
  lesson: Lesson.last,
  user: User.all.sample
)
Comment.create(
  content: 'How are you today',
  lesson: Lesson.last,
  user: User.all.sample
)

Question.create(
  lesson: Lesson.last,
  position: 2,
  content: Faker::TvShows::MichaelScott.quote,
  explanation: Faker::Lorem.sentence
)
4.times do
  Answer.create(
    question: Question.last,
    is_correct: [true, false].sample,
    content: Faker::Lorem.word,
  )
end


puts '-------------------- Lessons (with content/video/questions/comments) table --------------------'
tp Lesson.all

#Subscriptions

student = User.find_by(email: 'student@learning.com')
Subscription.create(user: student, learning_path: LearningPath.first)
Subscription
  .last
  .learning_path
  .courses
  .each do |course|
    ProgressState.create(subscription: Subscription.last, course: course)
  end
Subscription.create(user: student, learning_path: LearningPath.last)
Subscription
  .last
  .learning_path
  .courses
  .each do |course|
    ProgressState.create(subscription: Subscription.last, course: course)
  end
puts '-------------------- Subscription (with progressState) table --------------------'
tp Subscription.all
