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

4.times do |index|
  i = index + 1
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: 'admin' + i.to_s + '@learning.com',
    password: 'bonjour',
    is_approved: true,
    is_reviewed: true,
    role: 'admin'
  )
end

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


4.times do |index|
  i = index + 1
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: 'teacher' + i.to_s + '@learning.com',
    password: 'bonjour',
    is_approved: true,
    is_reviewed: true,
    role: 'teacher'
  )
end

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

4.times do |index|
  i = index + 1
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: 'student' + i.to_s + '@learning.com',
    password: 'bonjour',
    is_approved: true,
    is_reviewed: true,
    role: 'student'
  )
end

# ------- One user of each role approved -------

8.times do |student|
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
Course.create(
  title: 'Apprenez ?? cr??er votre site web avec HTML5 et CSS3',
  description:
    "Vous souhaitez cr??er vos propres sites web ? Vous ??tes au bon endroit ! Dans ce cours, vous apprendrez comment utiliser HTML5 et CSS3, les deux langages de programmation ?? la base de tous les sites web.
Vous pensez peut-??tre que vous n'??tes pas fait pour apprendre un langage informatique, mais ne vous inqui??tez pas : HTML et CSS sont des langages simples, que nous allons d??couvrir pas ?? pas, au cours de nombreux exercices. Vous serez bient??t capable d'ajouter du texte ?? votre site, de construire un menu de navigation, d'ins??rer des images... et bien plus encore !"
)
Course.create(
  title: 'Apprenez ?? programmer avec JavaScript',
  description:
    "Pour cr??er des programmes d'ordinateur ou b??tir l'application de vos r??ves, vous devez savoir comment coder dans un langage de programmation. Les applications s'appuient sur des donn??es et une logique pour accomplir leur magie, et cela exige qu'un programmeur - vous - indique ?? l'ordinateur ce qu'il faut faire et comment. Mais comment ??crire des applications, au fait ? O?? commencer ?"
)
Course.create(
  title: 'Initiez-vous ?? la gestion de projet agile',
  description:
    "En gestion de projet, vous pouvez ??prouver des difficult??s ?? maintenir la motivation de votre ??quipe. C???est encore plus difficile lorsque le projet change soudainement en cours de r??alisation. Pas de panique ! Afin d'??viter que les impr??vus ne d??routent votre ??quipe, il existe plusieurs mod??les de d??veloppement dits ???agiles???. En plus d'adapter vos pratiques ?? des innovations incertaines et changeantes, ils favorisent aussi une communication conviviale et transparente ! ????"
)
Course.create(
  title: 'Prenez la parole en public',
  description:
    "Si vous avez envie d'am??liorer l'impact de vos prises de parole en public, de d??velopper votre charisme ?? l'oral, de combattre votre timidit?? et r??duire votre stress, d'acqu??rir les comp??tences pour ??tre plus ?? l'aise devant les autres???
  Alors vous ??tes au bon endroit !"
)
Course.create(
  title: 'Utilisez Git et GitHub pour vos projets de d??veloppement',
  description:
    "Git permet de suivre les modifications et organiser votre projet. C???est un outil essentiel, que vous travailliez seul, en ??quipe, ou m??me sur un projet en open source !
  Dans ce cours, vous installerez et configurerez Git et son ami GitHub. Vous d??couvrirez les commandes de base avant d'apprendre ?? corriger vos erreurs simplement et efficacement. Vous d??couvrirez la structure de l'arbre Git et comment garder vos branches propres. Enfin, vous apprendrez ?? utiliser GitFlow et ?? g??rer les demandes de pull."
)
Course.create(
  title: 'D??couvrez le monde des start-ups',
  description:
    'L???univers et le fonctionnement des start-ups vous int??ressent ? Vous avez quelques id??es en t??te, sans savoir comment vous lancer ? Vous aimeriez savoir o?? vous former ? Comment rencontrer les bonnes personnes ? Ce cours est fait pour vous !
  Il ne faut pas croire que les entrepreneurs sont tous des fils de??? Cr??er sa start-up n???est pas r??serv?? ?? quelques happy few : vous pouvez cr??er votre entreprise, que vous soyez ??tudiant, salari??, jeune ou pas, femme ou homme.'
)
Course.create(
  title: "Ma??trisez les fondamentaux d'Excel",
  description:
    "Le logiciel Excel fait partie des logiciels les plus utilis??s dans le monde. Tous ceux qui s'en servent au quotidien savent que ce n'est pas sans raison ! Excel vous permet facilement de traiter de nombreuses donn??es et de les mettre en forme.
  Ce cours vous permettra de prendre en main ce logiciel si vous ??tes d??butant, de mettre en page vos donn??es pour qu'elles soient facilement lisibles, puis d'aller plus loin en manipulant les donn??es avec les formules, les fonctionnalit??s de tri, les tableaux crois??s dynamiques, etc."
)
Course.create(
  title: "Python n'est toujours pas un serpent !",
  description:
    'Pour cr??er des programmes informatiques ou construire des algorithmes destin??s ?? l???analyse de donn??es, vous devez ma??triser un langage de programmation.
  Un programme dit ?? un ordinateur quoi faire, gr??ce ?? des donn??es et des instructions que vous allez d??velopper ! Alors, par o?? commencer pour ??crire vos propres programmes en Python ?
  Ce cours va vous apprendre les bases du langage de programmation Python, n??cessaire pour ??voluer dans le domaine de l???analyse de donn??es. '
)
Course.create(
  title: "Python n'est pas un serpent !",
  description:
    "Gr??ce ?? la programmation orient??e objet, nous allons r??aliser ensemble un monde virtuel peupl?? d'humains, qui nous servira de terrain d'exp??rimentation pour v??rifier notre th??orie !
  Cela nous permettra au passage de d??couvrir l'univers fabuleux de la programmation orient??e objet (POO). Nous verrons ce qu'est un diagramme de classe (il sera essentiel dans la conception de notre programme !), puis nous coderons le programme en lui-m??me avec Python. Nous d??couvrirons les classes, les attributs, l???h??ritage et plein d???autres concepts r??jouissants !"
)
Course.create(
  title: 'Ruby on rails est tout ce dont vous avez toujours r??v?? !',
  description:
    'Le monde du Web vous int??resse, mais vous n???y connaissez rien???? Vous d??crochez quand vous entendez du vocabulaire geek???? Ce cours a pour objectif de vous mettre ?? niveau. Aucune connaissance pr??alable n???est requise.
  Vous d??couvrirez l???histoire du Web, comprendrez ?? quoi servent les langages et frameworks, et explorerez plusieurs m??tiers du web ! Vous serez capable de comprendre le monde du d??veloppement web et vous pourrez vous lancer dans cette voie si vous le souhaitez.'
)
Course.create(
  title: 'D??butez la programmation avec Java',
  description:
    "Pour cr??er des programmes informatiques ou concevoir l'application de vos r??ves, vous devez savoir coder dans un langage de programmation. Les programmes s'appuient sur des donn??es et sur la logique pour fonctionner. Pour cela, un programmeur (vous !) doit dire ?? l'ordinateur ce qu'il doit faire et comment il doit le faire."
)
Course.create(
  title: "Entraine-toi ?? l'algorithmie",
  description:
    'Comment un GPS trouve-t-il l???itin??raire qui nous fera esquiver les bouchons???? Comment Google nous pr??sente-t-il toujours la page que nous cherchons, ou Spotify sait-il avant nous la prochaine musique qui nous fera vibrer????
  Gr??ce ?? l???algorithmique???! C???est un des outils les plus puissants que nous avons pour r??soudre les probl??mes qui se mettent en travers de notre route. Dans ce cours, nous aborderons les diff??rentes structures de donn??es, de r??cursivit?? ou encore de complexit??'
)
Course.create(
  title: '??crivez du JavaScript pour le web',
  description:
    "Dans ce cours, vous apprendrez ?? manipuler le DOM pour r??cup??rer des ??l??ments d'une page et de modifier leur contenu, leurs classes, leurs styles etc. Cela rendra vos pages web plus dynamiques.

  Ce cours vous apprendra ??galement ?? capter les interactions de vos utilisateurs, que ce soit un clic de souris ou le remplissage d'un formulaire, pour pouvoir r??agir ?? ces ??v??nements."
)

puts '-------------------- Courses table --------------------'
tp Course.all

# CATEGORIES
Category.create(title: 'Business')
Category.create(title: 'Web developer')
Category.create(title: 'Ruby')
Category.create(title: 'Javascript')
Category.create(title: 'Python')
Category.create(title: 'Coding')
Category.create(title: 'Management')

# LEARNING PATHS
business =
  LearningPath.create(
    title: 'Cr??ez votre propre entreprise',
    price_in_cents: 50_000
  )
business.courses << [
  Course.find_by(title: 'Prenez la parole en public'),
  Course.find_by(title: 'D??couvrez le monde des start-ups'),
  Course.find_by(title: 'Initiez-vous ?? la gestion de projet agile'),
  Course.find_by(title: "Ma??trisez les fondamentaux d'Excel")
]
business.categories << [
  Category.find_by(title: 'Business'),
  Category.find_by(title: 'Management')
]

code =
  LearningPath.create(title: 'Devenez d??veloppeur web', price_in_cents: 80_000)
code.courses << [
  Course.find_by(title: 'Apprenez ?? cr??er votre site web avec HTML5 et CSS3'),
  Course.find_by(title: 'Apprenez ?? programmer avec JavaScript'),
  Course.find_by(
    title: 'Utilisez Git et GitHub pour vos projets de d??veloppement'
  )
]
code.categories << [
  Category.find_by(title: 'Web developer'),
  Category.find_by(title: 'Javascript'),
  Category.find_by(title: 'Management')
]

data_science =
  LearningPath.create(
    title: 'Immersion en data science',
    price_in_cents: 100_000
  )
data_science.courses << [
  Course.find_by(title: "Python n'est pas un serpent !"),
  Course.find_by(title: "Python n'est toujours pas un serpent !")
]

data_science.categories << [Category.find_by(title: 'Python')]

misc =
  LearningPath.create(title: 'Apprenez un peu de tout', price_in_cents: 400_000)
misc.courses << [
  Course.find_by(
    title: 'Ruby on rails est tout ce dont vous avez toujours r??v?? !'
  ),
  Course.find_by(title: "Entraine-toi ?? l'algorithmie"),
  Course.find_by(title: 'D??couvrez le monde des start-ups'),
  Course.find_by(title: 'Initiez-vous ?? la gestion de projet agile'),
  Course.find_by(title: 'Apprenez ?? cr??er votre site web avec HTML5 et CSS3')
]

misc.categories << [
  Category.find_by(title: 'Business'),
  Category.find_by(title: 'Web developer'),
  Category.find_by(title: 'Ruby')
]

#Solo courses, with learning paths and categories
start =
  LearningPath.create(
    title: 'Apprenez ?? cr??er votre site web avec HTML5 et CSS3',
    price_in_cents: 10_000
  )
start.courses <<
  Course.find_by(title: 'Apprenez ?? cr??er votre site web avec HTML5 et CSS3')
start.categories << [Category.find_by(title: 'Coding')]

python =
  LearningPath.create(
    title: "Python n'est pas un serpent !",
    price_in_cents: 20_000
  )
python.courses << Course.find_by(title: "Python n'est pas un serpent !")
python.categories << [
  Category.find_by(title: 'Coding'),
  Category.find_by(title: 'Python')
]

pythonadv =
  LearningPath.create(
    title: "Python n'est toujours pas un serpent !",
    price_in_cents: 30_000
  )
pythonadv.courses <<
  Course.find_by(title: "Python n'est toujours pas un serpent !")
pythonadv.categories << [
  Category.find_by(title: 'Coding'),
  Category.find_by(title: 'Python')
]

ruby =
  LearningPath.create(
    title: 'Ruby on rails est tout ce dont vous avez toujours r??v?? !',
    price_in_cents: 30_000
  )
ruby.courses <<
  Course.find_by(
    title: 'Ruby on rails est tout ce dont vous avez toujours r??v?? !'
  )
ruby.categories << [
  Category.find_by(title: 'Coding'),
  Category.find_by(title: 'Ruby')
]

jsnoob =
  LearningPath.create(
    title: '??crivez du JavaScript pour le web',
    price_in_cents: 5000
  )
jsnoob.courses << Course.find_by(title: '??crivez du JavaScript pour le web')
jsnoob.categories << [
  Category.find_by(title: 'Coding'),
  Category.find_by(title: 'Javascript')
]

codewars =
  LearningPath.create(
    title: "Entraine-toi ?? l'algorithmie",
    price_in_cents: 5000
  )
codewars.courses << Course.find_by(title: "Entraine-toi ?? l'algorithmie")
codewars.categories << [Category.find_by(title: 'Coding')]

jsadv =
  LearningPath.create(
    title: 'Apprenez ?? programmer avec JavaScript',
    price_in_cents: 5000
  )
jsadv.courses << Course.find_by(title: 'Apprenez ?? programmer avec JavaScript')
jsadv.categories << [
  Category.find_by(title: 'Coding'),
  Category.find_by(title: 'Javascript')
]

LearningPath.all.each do |learning_path|
  learning_path.update(description: Faker::Lorem.paragraph(sentence_count: 4))
end
puts '-------------------- Learning paths table --------------------'
tp LearningPath.all

#Chapters
webpage =
  Chapter.create(
    title: 'What is a web page',
    position: 1,
    course:
      Course.find_by(
        title: 'Apprenez ?? cr??er votre site web avec HTML5 et CSS3'
      )
  )
html =
  Chapter.create(
    title: 'Html basics',
    position: 2,
    course:
      Course.find_by(
        title: 'Apprenez ?? cr??er votre site web avec HTML5 et CSS3'
      )
  )
css =
  Chapter.create(
    title: 'Css basics',
    position: 3,
    course:
      Course.find_by(
        title: 'Apprenez ?? cr??er votre site web avec HTML5 et CSS3'
      )
  )

puts '-------------------- Chapters paths table --------------------'
tp Chapter.all

#Lessons
Lesson.create(
  title: 'Historic',
  position: 1,
  chapter: webpage,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: 'https://learningstuff-website.s3.eu-west-3.amazonaws.com/De%CC%81mystifier+Stripe+version+2019.mp4'
)

Lesson.create(
  title: 'Client and server',
  position: 2,
  chapter: webpage,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: 'https://learningstuff-website.s3.eu-west-3.amazonaws.com/De%CC%81mystifier+Stripe+version+2019.mp4'
)

Lesson.create(
  title: 'What is a browser',
  position: 3,
  chapter: webpage,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: 'https://learningstuff-website.s3.eu-west-3.amazonaws.com/De%CC%81mystifier+Stripe+version+2019.mp4'
)

Lesson.create(
  title: 'Historic',
  position: 1,
  chapter: html,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: 'https://learningstuff-website.s3.eu-west-3.amazonaws.com/De%CC%81mystifier+Stripe+version+2019.mp4'
)

Lesson.create(
  title: 'Useful resources',
  position: 2,
  chapter: html,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: 'https://learningstuff-website.s3.eu-west-3.amazonaws.com/De%CC%81mystifier+Stripe+version+2019.mp4'
)

Lesson.create(
  title: 'How to organize your page',
  position: 3,
  chapter: html,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: 'https://learningstuff-website.s3.eu-west-3.amazonaws.com/De%CC%81mystifier+Stripe+version+2019.mp4'
)

Lesson.create(
  title: 'Historic',
  position: 1,
  chapter: css,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: 'https://learningstuff-website.s3.eu-west-3.amazonaws.com/De%CC%81mystifier+Stripe+version+2019.mp4'
)

Lesson.create(
  title: 'Colors and font',
  position: 2,
  chapter: css,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: 'https://learningstuff-website.s3.eu-west-3.amazonaws.com/De%CC%81mystifier+Stripe+version+2019.mp4'
)

Lesson.create(
  title: 'Proper indentation',
  position: 3,
  chapter: css,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: 'https://learningstuff-website.s3.eu-west-3.amazonaws.com/De%CC%81mystifier+Stripe+version+2019.mp4'
)

Lesson.all.each do |lesson|
  Comment.create(
    content: "Bonjour, n'h??sitez pas si vous avez des questions !",
    lesson: lesson,
    user: User.where(role: "teacher").sample
  )
  Comment.create(
    content: "Hello, est-ce que quelqu'un peut m'expliquer la question 2 du quizz svp ?",
    lesson: lesson,
    user: User.where(role: "student").sample
  )
  2.times do
    Question.create(
      lesson: lesson,
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
  end
  3.times do
    Question.create(
      lesson: lesson,
      content: Faker::TvShows::MichaelScott.quote,
      explanation: Faker::Lorem.sentence
    )
    2.times do
      Answer.create(
        question: Question.last,
        is_correct: false,
        content: Faker::Lorem.word
      )
    end
    2.times do
      Answer.create(
        question: Question.last,
        is_correct: true,
        content: Faker::Lorem.word
      )
    end
  end
end

puts '-------------------- Lessons (with content/video/questions/comments) table --------------------'
tp Lesson.all

Course
  .where
  .missing(:chapters)
  .each do |course|
    puts '///// STARTING IMPORT FROM GITHUB //////'
    puts course.title
    title = course.title
    course.import_content('https://github.com/cha-fa/course_content_example')
    course.update!(title: title)
    puts course.title
  end

#Subscriptions
prefix = "student"
students = User.where("email LIKE ?", "#{prefix}%")

students.each do |student|
  student.subscriptions.create(
    learning_path: LearningPath.find_by(title: 'Devenez d??veloppeur web')
  )
  student
    .subscriptions
    .last
    .courses
    .each { |course| student.progress_states.find_or_create_by(course: course) }

  student.subscriptions.create(
    learning_path:
      LearningPath.find_by(
        title: 'Apprenez ?? cr??er votre site web avec HTML5 et CSS3'
      )
  )
  student
    .subscriptions
    .last
    .courses
    .each { |course| student.progress_states.find_or_create_by(course: course) }
end
puts '-------------------- Subscription (with progressState) table --------------------'
tp Subscription.all

