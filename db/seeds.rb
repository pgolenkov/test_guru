# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

admin = Admin.create(
  email: 'admin@testguru.ru',
  password: '123456',
  first_name: 'Администратор',
  last_name: 'Системы'
)

back, front, devops = %w[backend frontend devops].map { |title| Category.create(title: title) }
tests = Test.create([{ title: 'Ruby', level: 1, category: back, owner: admin },
                     { title: 'PHP', level: 2, category: back, owner: admin },
                     { title: 'AngularJS', level: 3, category: front, owner: admin },
                     { title: 'CSS', level: 2, category: front, owner: admin },
                     { title: 'Linux', level: 1, category: devops, owner: admin }])

questions = Question.create(
  [
    { body: 'Назовите метод, позволяющий добавить в массив новое значение', test: tests[0] },
    { body: 'Какой вид типизации используется в языке Ruby?', test: tests[0] },
    { body: 'Кто автор языка Ruby?', test: tests[0] },
    { body: 'Какой сервис используется в Angular для работы с RESTful API?', test: tests[2] },
    { body: 'Для каких целей используется селектор + ?', test: tests[3] }
  ]
)

answers = Answer.create(
  [
    { body: 'pop', question: questions[0] },
    { body: 'push', question: questions[0], correct: true },
    { body: 'insert', question: questions[0], correct: true },

    { body: 'Статическая типизация', question: questions[1] },
    { body: 'Динамическая типизация', question: questions[1], correct: true },
    { body: 'Строгая типизация', question: questions[1], correct: true },

    { body: 'Matz', question: questions[2], correct: true },
    { body: 'DHH', question: questions[2] },
    { body: 'Google', question: questions[2] },

    { body: '$scope', question: questions[3] },
    { body: '$resource', question: questions[3], correct: true },
    { body: '$http', question: questions[3], correct: true },

    { body: 'Выбирает элемент, который находится непосредственно после указанного \
элемента, если у них общий родитель', question: questions[4], correct: true },
    { body: 'Выбирает элементы, которые являются дочерними непосредственно по \
отношению к указанному элементу', question: questions[4] },
    { body: 'Выбирает элементы, которые находятся после указанного элемента, \
если у них общий родитель', question: questions[4] }
  ]
)
