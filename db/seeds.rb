# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ name: 'Joe', email: 'joe@example.com', password: 'password456', password_confirmation: 'password456' }, { name: 'Brooke', email: 'brooke@example.com', password: 'password789', password_confirmation: 'password789' }])

notes = Note.create([{ user_id: 1, title: 'pay taxes', content: 'pay all your taxes', resolution_date: 'January 6, 2021' }, { user_id: 1, title: 'Current Sprint', content: 'do this and that for the scrum situation kanban blah blah', resolution_date: 'January 8, 2021' }, { user_id: 2, title: 'Wash Dishes', content: 'wash them good', resolution_date: 'January 7, 2021' }, { user_id: 2, title: 'change into butterfly', content: 'its getting late in the year', resolution_date: 'January 20, 2021' }])


cateogries = Category.create([{ user_id: 1, category: 'to do list'}, { user_id: 1, category: 'work'}, { user_id: 1, category: 'home'}, { user_id: 1, category: 'urgent' }])