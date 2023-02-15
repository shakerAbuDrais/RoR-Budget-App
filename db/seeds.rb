# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
category = Category.create(name: 'Category 1', icon: 'icon_1.png')
payment1 = Payment.create(name: 'Transaction 1', amount: 100.0, category_id: 2)
payment1.categories << category
