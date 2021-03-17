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

Course.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(Course.table_name)

Category.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(Category.table_name)

AllowlistedJwt.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(AllowlistedJwt.table_name)

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

puts '-------------------- Courses table --------------------'
tp Course.all

# LEARNING PATHS
business =
  LearningPath.create(title: 'Start your own business', price_in_cents: 50_000)
business.courses << [
  Course.find_by(title: 'Speak in public'),
  Course.find_by(title: 'Learn about Lean Startup'),
  Course.find_by(title: 'Learn About Agile Project Management and SCRUM'),
  Course.find_by(title: 'Organize your data in a spreadsheet')
]

code =
  LearningPath.create(title: 'Become a web developer', price_in_cents: 80_000)
code.courses << [
  Course.find_by(title: 'Build Your First Web Pages With HTML and CSS'),
  Course.find_by(title: 'Learn Programming With JavaScript'),
  Course.find_by(title: 'Manage Your Code Project With Git & Github')
]

start =
  LearningPath.create(
    title: 'Get started with web development',
    price_in_cents: 10_000
  )
start.courses <<
  Course.find_by(title: 'Build Your First Web Pages With HTML and CSS')

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
Lesson.create(title: 'Historic', position: 1, chapter: webpage)
LessonVideo.create(lesson: Lesson.last, url: Faker::Internet.url)
LessonContent.create(
  lesson: Lesson.last,
  text: Faker::Markdown.sandwich(sentences: 6, repeat: 3)
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
  content: Faker::TvShows::MichaelScott.quote
)
Question.create(
  lesson: Lesson.last,
  position: 2,
  content: Faker::TvShows::MichaelScott.quote
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)

Lesson.create(title: 'Client and server', position: 2, chapter: webpage)
LessonVideo.create(lesson: Lesson.last, url: Faker::Internet.url)
LessonContent.create(
  lesson: Lesson.last,
  text: Faker::Markdown.sandwich(sentences: 6, repeat: 3)
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
  content: Faker::TvShows::MichaelScott.quote
)
Question.create(
  lesson: Lesson.last,
  position: 2,
  content: Faker::TvShows::MichaelScott.quote
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)

Lesson.create(title: 'What is a browser', position: 3, chapter: webpage)
LessonVideo.create(lesson: Lesson.last, url: Faker::Internet.url)
LessonContent.create(
  lesson: Lesson.last,
  text: Faker::Markdown.sandwich(sentences: 6, repeat: 3)
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
  content: Faker::TvShows::MichaelScott.quote
)
Question.create(
  lesson: Lesson.last,
  position: 2,
  content: Faker::TvShows::MichaelScott.quote
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)

Lesson.create(title: 'Historic', position: 1, chapter: html)
LessonVideo.create(lesson: Lesson.last, url: Faker::Internet.url)
LessonContent.create(
  lesson: Lesson.last,
  text: Faker::Markdown.sandwich(sentences: 6, repeat: 3)
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
  content: Faker::TvShows::MichaelScott.quote
)
Question.create(
  lesson: Lesson.last,
  position: 2,
  content: Faker::TvShows::MichaelScott.quote
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)

Lesson.create(title: 'Useful resources', position: 2, chapter: html)
LessonVideo.create(lesson: Lesson.last, url: Faker::Internet.url)
LessonContent.create(
  lesson: Lesson.last,
  text: Faker::Markdown.sandwich(sentences: 6, repeat: 3)
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
  content: Faker::TvShows::MichaelScott.quote
)
Question.create(
  lesson: Lesson.last,
  position: 2,
  content: Faker::TvShows::MichaelScott.quote
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)

Lesson.create(title: 'How to organize your page', position: 3, chapter: html)
LessonVideo.create(lesson: Lesson.last, url: Faker::Internet.url)
LessonContent.create(
  lesson: Lesson.last,
  text: Faker::Markdown.sandwich(sentences: 6, repeat: 3)
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
  content: Faker::TvShows::MichaelScott.quote
)
Question.create(
  lesson: Lesson.last,
  position: 2,
  content: Faker::TvShows::MichaelScott.quote
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)

Lesson.create(title: 'Historic', position: 1, chapter: css)
LessonVideo.create(lesson: Lesson.last, url: Faker::Internet.url)
LessonContent.create(
  lesson: Lesson.last,
  text: Faker::Markdown.sandwich(sentences: 6, repeat: 3)
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
  content: Faker::TvShows::MichaelScott.quote
)
Question.create(
  lesson: Lesson.last,
  position: 2,
  content: Faker::TvShows::MichaelScott.quote
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)

Lesson.create(title: 'Colors and font', position: 2, chapter: css)
LessonVideo.create(lesson: Lesson.last, url: Faker::Internet.url)
LessonContent.create(
  lesson: Lesson.last,
  text: Faker::Markdown.sandwich(sentences: 6, repeat: 3)
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
  content: Faker::TvShows::MichaelScott.quote
)
Question.create(
  lesson: Lesson.last,
  position: 2,
  content: Faker::TvShows::MichaelScott.quote
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)

Lesson.create(title: 'Proper indentation', position: 3, chapter: css)
LessonVideo.create(lesson: Lesson.last, url: Faker::Internet.url)
LessonContent.create(
  lesson: Lesson.last,
  text: Faker::Markdown.sandwich(sentences: 6, repeat: 3)
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
  content: Faker::TvShows::MichaelScott.quote
)
Question.create(
  lesson: Lesson.last,
  position: 2,
  content: Faker::TvShows::MichaelScott.quote
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)
Answer.create(
  question: Question.last,
  is_correct: [true, false].sample,
  content: Faker::Lorem.word,
  explanation: Faker::Lorem.sentence
)

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
