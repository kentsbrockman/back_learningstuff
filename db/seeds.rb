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
Course.create(
  title: 'Apprenez à créer votre site web avec HTML5 et CSS3',
  description:
    "Vous souhaitez créer vos propres sites web ? Vous êtes au bon endroit ! Dans ce cours, vous apprendrez comment utiliser HTML5 et CSS3, les deux langages de programmation à la base de tous les sites web.
Vous pensez peut-être que vous n'êtes pas fait pour apprendre un langage informatique, mais ne vous inquiétez pas : HTML et CSS sont des langages simples, que nous allons découvrir pas à pas, au cours de nombreux exercices. Vous serez bientôt capable d'ajouter du texte à votre site, de construire un menu de navigation, d'insérer des images... et bien plus encore !"
)
Course.create(
  title: 'Apprenez à programmer avec JavaScript',
  description:
    "Pour créer des programmes d'ordinateur ou bâtir l'application de vos rêves, vous devez savoir comment coder dans un langage de programmation. Les applications s'appuient sur des données et une logique pour accomplir leur magie, et cela exige qu'un programmeur - vous - indique à l'ordinateur ce qu'il faut faire et comment. Mais comment écrire des applications, au fait ? Où commencer ?"
)
Course.create(
  title: 'Initiez-vous à la gestion de projet agile',
  description:
    "En gestion de projet, vous pouvez éprouver des difficultés à maintenir la motivation de votre équipe. C’est encore plus difficile lorsque le projet change soudainement en cours de réalisation. Pas de panique ! Afin d'éviter que les imprévus ne déroutent votre équipe, il existe plusieurs modèles de développement dits “agiles”. En plus d'adapter vos pratiques à des innovations incertaines et changeantes, ils favorisent aussi une communication conviviale et transparente ! 👌"
)
Course.create(
  title: 'Prenez la parole en public',
  description:
    "Si vous avez envie d'améliorer l'impact de vos prises de parole en public, de développer votre charisme à l'oral, de combattre votre timidité et réduire votre stress, d'acquérir les compétences pour être plus à l'aise devant les autres…
  Alors vous êtes au bon endroit !"
)
Course.create(
  title: 'Utilisez Git et GitHub pour vos projets de développement',
  description:
    "Git permet de suivre les modifications et organiser votre projet. C’est un outil essentiel, que vous travailliez seul, en équipe, ou même sur un projet en open source !
  Dans ce cours, vous installerez et configurerez Git et son ami GitHub. Vous découvrirez les commandes de base avant d'apprendre à corriger vos erreurs simplement et efficacement. Vous découvrirez la structure de l'arbre Git et comment garder vos branches propres. Enfin, vous apprendrez à utiliser GitFlow et à gérer les demandes de pull."
)
Course.create(
  title: 'Découvrez le monde des start-ups',
  description:
    'L’univers et le fonctionnement des start-ups vous intéressent ? Vous avez quelques idées en tête, sans savoir comment vous lancer ? Vous aimeriez savoir où vous former ? Comment rencontrer les bonnes personnes ? Ce cours est fait pour vous !
  Il ne faut pas croire que les entrepreneurs sont tous des fils de… Créer sa start-up n’est pas réservé à quelques happy few : vous pouvez créer votre entreprise, que vous soyez étudiant, salarié, jeune ou pas, femme ou homme.'
)
Course.create(
  title: "Maîtrisez les fondamentaux d'Excel",
  description:
    "Le logiciel Excel fait partie des logiciels les plus utilisés dans le monde. Tous ceux qui s'en servent au quotidien savent que ce n'est pas sans raison ! Excel vous permet facilement de traiter de nombreuses données et de les mettre en forme.
  Ce cours vous permettra de prendre en main ce logiciel si vous êtes débutant, de mettre en page vos données pour qu'elles soient facilement lisibles, puis d'aller plus loin en manipulant les données avec les formules, les fonctionnalités de tri, les tableaux croisés dynamiques, etc."
)
Course.create(
  title: "Python n'est toujours pas un serpent !",
  description:
    'Pour créer des programmes informatiques ou construire des algorithmes destinés à l’analyse de données, vous devez maîtriser un langage de programmation.
  Un programme dit à un ordinateur quoi faire, grâce à des données et des instructions que vous allez développer ! Alors, par où commencer pour écrire vos propres programmes en Python ?
  Ce cours va vous apprendre les bases du langage de programmation Python, nécessaire pour évoluer dans le domaine de l’analyse de données. '
)
Course.create(
  title: "Python n'est pas un serpent !",
  description:
    "Grâce à la programmation orientée objet, nous allons réaliser ensemble un monde virtuel peuplé d'humains, qui nous servira de terrain d'expérimentation pour vérifier notre théorie !
  Cela nous permettra au passage de découvrir l'univers fabuleux de la programmation orientée objet (POO). Nous verrons ce qu'est un diagramme de classe (il sera essentiel dans la conception de notre programme !), puis nous coderons le programme en lui-même avec Python. Nous découvrirons les classes, les attributs, l’héritage et plein d’autres concepts réjouissants !"
)
Course.create(
  title: 'Ruby on rails est tout ce dont vous avez toujours rêvé !',
  description:
    'Le monde du Web vous intéresse, mais vous n’y connaissez rien ? Vous décrochez quand vous entendez du vocabulaire geek ? Ce cours a pour objectif de vous mettre à niveau. Aucune connaissance préalable n’est requise.
  Vous découvrirez l’histoire du Web, comprendrez à quoi servent les langages et frameworks, et explorerez plusieurs métiers du web ! Vous serez capable de comprendre le monde du développement web et vous pourrez vous lancer dans cette voie si vous le souhaitez.'
)
Course.create(
  title: 'Débutez la programmation avec Java',
  description:
    "Pour créer des programmes informatiques ou concevoir l'application de vos rêves, vous devez savoir coder dans un langage de programmation. Les programmes s'appuient sur des données et sur la logique pour fonctionner. Pour cela, un programmeur (vous !) doit dire à l'ordinateur ce qu'il doit faire et comment il doit le faire."
)
Course.create(
  title: "Entraine-toi à l'algorithmie",
  description:
    'Comment un GPS trouve-t-il l’itinéraire qui nous fera esquiver les bouchons ? Comment Google nous présente-t-il toujours la page que nous cherchons, ou Spotify sait-il avant nous la prochaine musique qui nous fera vibrer ?
  Grâce à l’algorithmique ! C’est un des outils les plus puissants que nous avons pour résoudre les problèmes qui se mettent en travers de notre route. Dans ce cours, nous aborderons les différentes structures de données, de récursivité ou encore de complexité'
)
Course.create(
  title: 'Écrivez du JavaScript pour le web',
  description:
    "Dans ce cours, vous apprendrez à manipuler le DOM pour récupérer des éléments d'une page et de modifier leur contenu, leurs classes, leurs styles etc. Cela rendra vos pages web plus dynamiques.

  Ce cours vous apprendra également à capter les interactions de vos utilisateurs, que ce soit un clic de souris ou le remplissage d'un formulaire, pour pouvoir réagir à ces événements."
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
    title: 'Créez votre propre entreprise',
    price_in_cents: 50_000
  )
business.courses << [
  Course.find_by(title: 'Prenez la parole en public'),
  Course.find_by(title: 'Découvrez le monde des start-ups'),
  Course.find_by(title: 'Initiez-vous à la gestion de projet agile'),
  Course.find_by(title: "Maîtrisez les fondamentaux d'Excel")
]
business.categories << [
  Category.find_by(title: 'Business'),
  Category.find_by(title: 'Management')
]

code =
  LearningPath.create(title: 'Devenez développeur web', price_in_cents: 80_000)
code.courses << [
  Course.find_by(title: 'Apprenez à créer votre site web avec HTML5 et CSS3'),
  Course.find_by(title: 'Apprenez à programmer avec JavaScript'),
  Course.find_by(
    title: 'Utilisez Git et GitHub pour vos projets de développement'
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
    title: 'Ruby on rails est tout ce dont vous avez toujours rêvé !'
  ),
  Course.find_by(title: "Entraine-toi à l'algorithmie"),
  Course.find_by(title: 'Découvrez le monde des start-ups'),
  Course.find_by(title: 'Initiez-vous à la gestion de projet agile'),
  Course.find_by(title: 'Apprenez à créer votre site web avec HTML5 et CSS3')
]

misc.categories << [
  Category.find_by(title: 'Business'),
  Category.find_by(title: 'Web developer'),
  Category.find_by(title: 'Ruby')
]

#Solo courses, with learning paths and categories
start =
  LearningPath.create(
    title: 'Apprenez à créer votre site web avec HTML5 et CSS3',
    price_in_cents: 10_000
  )
start.courses <<
  Course.find_by(title: 'Apprenez à créer votre site web avec HTML5 et CSS3')
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
    title: 'Ruby on rails est tout ce dont vous avez toujours rêvé !',
    price_in_cents: 30_000
  )
ruby.courses <<
  Course.find_by(
    title: 'Ruby on rails est tout ce dont vous avez toujours rêvé !'
  )
ruby.categories << [
  Category.find_by(title: 'Coding'),
  Category.find_by(title: 'Ruby')
]

jsnoob =
  LearningPath.create(
    title: 'Écrivez du JavaScript pour le web',
    price_in_cents: 5000
  )
jsnoob.courses << Course.find_by(title: 'Écrivez du JavaScript pour le web')
jsnoob.categories << [
  Category.find_by(title: 'Coding'),
  Category.find_by(title: 'Javascript')
]

codewars =
  LearningPath.create(
    title: "Entraine-toi à l'algorithmie",
    price_in_cents: 5000
  )
codewars.courses << Course.find_by(title: "Entraine-toi à l'algorithmie")
codewars.categories << [Category.find_by(title: 'Coding')]

jsadv =
  LearningPath.create(
    title: 'Apprenez à programmer avec JavaScript',
    price_in_cents: 5000
  )
jsadv.courses << Course.find_by(title: 'Apprenez à programmer avec JavaScript')
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
        title: 'Apprenez à créer votre site web avec HTML5 et CSS3'
      )
  )
html =
  Chapter.create(
    title: 'Html basics',
    position: 2,
    course:
      Course.find_by(
        title: 'Apprenez à créer votre site web avec HTML5 et CSS3'
      )
  )
css =
  Chapter.create(
    title: 'Css basics',
    position: 3,
    course:
      Course.find_by(
        title: 'Apprenez à créer votre site web avec HTML5 et CSS3'
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
  video_url: 'https://www.youtube.com/watch?v=i_dOaAqx6GU'
)

Lesson.create(
  title: 'Client and server',
  position: 2,
  chapter: webpage,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: 'https://www.youtube.com/watch?v=i_dOaAqx6GU'
)

Lesson.create(
  title: 'What is a browser',
  position: 3,
  chapter: webpage,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: 'https://www.youtube.com/watch?v=i_dOaAqx6GU'
)

Lesson.create(
  title: 'Historic',
  position: 1,
  chapter: html,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: 'https://www.youtube.com/watch?v=i_dOaAqx6GU'
)

Lesson.create(
  title: 'Useful resources',
  position: 2,
  chapter: html,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: 'https://www.youtube.com/watch?v=i_dOaAqx6GU'
)

Lesson.create(
  title: 'How to organize your page',
  position: 3,
  chapter: html,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: 'https://www.youtube.com/watch?v=i_dOaAqx6GU'
)

Lesson.create(
  title: 'Historic',
  position: 1,
  chapter: css,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: 'https://www.youtube.com/watch?v=i_dOaAqx6GU'
)

Lesson.create(
  title: 'Colors and font',
  position: 2,
  chapter: css,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: 'https://www.youtube.com/watch?v=i_dOaAqx6GU'
)

Lesson.create(
  title: 'Proper indentation',
  position: 3,
  chapter: css,
  content: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
  video_url: 'https://www.youtube.com/watch?v=i_dOaAqx6GU'
)

Lesson.all.each do |lesson|
  Comment.create(
    content: 'Hello everybody',
    lesson: lesson,
    user: User.all.sample
  )
  Comment.create(
    content: 'How are you today',
    lesson: lesson,
    user: User.all.sample
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

student = User.find_by(email: 'student@learning.com')

student.subscriptions.create(
  learning_path: LearningPath.find_by(title: 'Devenez développeur web')
)
student
  .subscriptions
  .last
  .courses
  .each { |course| student.progress_states.find_or_create_by(course: course) }

student.subscriptions.create(
  learning_path:
    LearningPath.find_by(
      title: 'Apprenez à créer votre site web avec HTML5 et CSS3'
    )
)
student
  .subscriptions
  .last
  .courses
  .each { |course| student.progress_states.find_or_create_by(course: course) }
puts '-------------------- Subscription (with progressState) table --------------------'
tp Subscription.all
