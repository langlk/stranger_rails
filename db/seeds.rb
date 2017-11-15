# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

plotlines = [
  ['Eleven', 'Adventures of Eleven, Wunderkid.'],
  ['Kids', 'Trials and tribulations of Mike, Lucas, Dustin, and associates.'],
  ['Teens', 'Strange times at Hawkins High.'],
  ['Will', 'Will! WILL! WILL!!!!!'],
  ['Town Infection', "There's something wrong with the pumpkins."]
]

plotlines.each do |plot_name, plot_description|
  Plotline.create(name: plot_name, description: plot_description)
end
