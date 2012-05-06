# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category_1 = Category.create :name => 'Entertainment'

Category.with_options :parent => category_1 do |category|
  category.create :name => 'Music'
  category.create :name => 'Games'
end

category_2 = Category.create :name => 'Business'

Category.with_options :parent => category_2 do |category|
  category.create :name => 'Management'
  category.create :name => 'Market'
  category.create :name => 'Deposit'
end

Category.with_options :parent => Category.find_by_name('Market') do |category|
  category.create :name => 'Stock'
end
