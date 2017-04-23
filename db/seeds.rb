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
puts "****************************************"
puts "Cidades"
require 'net/http'
require 'net/https' # for ruby 1.8.7
require 'json'

module BRPopulate
  def self.states
    http = Net::HTTP.new('raw.githubusercontent.com', 443); http.use_ssl = true
    JSON.parse http.get('/celsodantas/br_populate/master/states.json').body
  end

  def self.capital?(city, state)
    city["name"] == state["capital"]
  end

  def self.populate
    states.each do |state|
      region_obj = Region.find_or_create_by(:name => state["region"])
      state_obj = State.new(:acronym => state["acronym"], :name => state["name"], :region => region_obj)
      state_obj.save

      state["cities"].each do |city|
        c = City.new
        c.name = city["name"]
        c.state = state_obj
        c.capital = capital?(city, state)
        c.save
      end
    end
  end
end

BRPopulate.populate
