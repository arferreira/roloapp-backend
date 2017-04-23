# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "****************************************"
puts "Create any categories for app"
puts "****************************************"
categories = ["Animais e Acessórios",
              "Esportes",
              "Para a sua casa",
              "Eletrônicos e Celulares",
              "Música e Hobbies",
              "Bebês e Crianças",
              "Moda e Beleza",
              "Veículos e Barcos",
              "Imóveis",
              "Empregos e Negócios"]
categories.each do |category|
Category.find_or_create_by!(description: category, status: true)
puts "Category: #{category} created was success!"
end
puts "\n"
puts "Categories generated with success!"
puts "****************************************"
puts "Create admin default for app"
puts "****************************************"

admin = Admin.new
admin.email = "admin@admin.com"
admin.name = "Antonio Ricardo"
admin.password = "123456"
admin.password_confirmation = "123456"
admin.role = 0

if admin.save
  puts "Admin created was success!"
else
  puts "Error Admin Create"
end
