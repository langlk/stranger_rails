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

episodes = [
  ['The Vanishing of Will Byers', 1, 1, 'A young boy disappears while riding home at night, and his friends and the local police conduct a desparate search for him. Meanwhile an unknown creature escapes from a nearby government energy lab, and the man in charge--Dr. Matthew Brenner-- will.'],
  ['The Weirdo on Maple Street', 1, 2, 'The boys take Eleven back to the house in the hopes she can help find Will. Joyce tells Jim about strange phone call and Jonathan confronts his father.'],
  ['Holly, Jolly', 1, 3, 'Joyce makes contact with Will. Nancy realizes Barbara has disappeared and the boys enlist Eleven to find Will.'],
  ['The Body', 1, 4, 'Joyce and Mike believe Will is alive and try to contact him. Jim continues his investigation into Hawkins Labs. Nancy and Jonathan grow closer after she realizes he took a picture of the same creature she saw in the woods.'],
  ['The Flea and the Acrobat', 1, 5, 'Realizing Joyce was right, Jim breaks into Hawkins Laboratory and finds the gate. Jonathan and Nancy join forces to look for the monster, while Dustin gets an idea of how to find the gate and Will.'],
  ['The Monster', 1, 6, 'Nancy narrowly survives an encounter with the monster, but gets in trouble with Steve. Meanwhile, Jim and Joyce investigate the missing child of Terry, and Lucas strikes off on his own when Mike insists on searching for Eleven.'],
  ['The Bathtub', 1, 7, 'The government closes in on Eleven and the boys, but Jim rescues them and everyone is reunited to figure out a way to get Eleven to the Upside Down and find Will.'],
  ['The Upside Down', 1, 8, 'While Jim and Joyce travel into the Upside Down to rescue Will, Jonathan and Nancy try to lure the monster to the Byers home. Meanwhile, the Army invades the middle school and tries to recapture Eleven.'],
  ['MADMAX', 2, 1, 'A year after he disappeared and returned, Will is dealing with the trauma of the Upside Down. Meanwhile, the government maintains an interest in him, and Jim pays a visit to the cabin in the woods.'],
  ['Trick or Treat, Freak', 2, 2, 'The boys go out trick-or-treating and Will pays another visit to the Upside Down. Meanwhile, Nancy starts to crack under the pressure of keeping the death of Barb a secret, and Eleven reaches out to Mike.'],
  ['The Pollywog', 2, 3, 'Jim takes his concerns to Owens, while Eleven sneaks away to go to the school and find Mike. Meanwhile, Dustin shows his new pet to his friends, and Bob gives Will some advice that does not go as intended.'],
  ['Will the Wise', 2, 4, 'Nancy and Jonathan are taken to Hawkins Labs after they try to tell Marsha the truth. Meanwhile, Will tells Joyce what he experienced. Billy warns Max against talking to Lucas, and Jim discovers what lies at the root of the pumpkin rotting problem.'],
  ['Dig Dug', 2, 5, 'Joyce convinces Bob to help them find Jim, who is trapped in the Upside Down. Meanwhile, Nancy and Jonathan take the tape to a potential ally, and Eleven finds Jane.'],
  ['The Spy', 2, 6, 'Lucas and Dustin recruit Max and Steve to help them trap Dart. Meanwhile, Will manages to tell the government team where the shadow creature is.'],
  ['The Lost Sister', 2, 7, 'Psychic visions lead Eleven to Chicago... and her lost sister, Eight, who uses the name Kali and is seeking revenge on the government men who tortured them and electroshocked Terry.'],
  ['The Mind Flayer', 2, 8, 'The group manages to escape Hawkins Lab, and they retreat to the Byers house to question Will as to how to defeat the Shadow Monster.'],
  ['The Gate', 2, 9, 'Eleven returns to help the others defeat the Mind Flayer, but first they have to evice its presence from Will or he will die with the creature and its demo-dogs.']
]

episodes.each do |episode_title, episode_season, episode_number, episode_description|
  Episode.create(title: episode_title, season: episode_season, number: episode_number, description: episode_description)
end
