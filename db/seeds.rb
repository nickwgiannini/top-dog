# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Breed.delete_all
Review.delete_all
User.delete_all

Breed.create(name: 'Affenpinscher',
  life_expectancy:'12-15 years',
  personality:'confident, famously funny, fearless',
  shedding:'Seasonal',
  height:'9-11.5 inches',
  weight:'7-10 pounds',
  grooming:'2-3 times a week brushing',
  img_url:'http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13002132/Affenpinscher-Care.jpg',
  )
Breed.create(
 name: 'Brussels Griffon',
 life_expectancy:'12-15 years',
 personality:'alert, curious, loyal',
 shedding:'Seasonal',
 height:'7-10 inches',
 weight:'8-10 pounds',
 grooming:'2-3 times a week brushing',
 img_url:'http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12213537/Brussels-Griffith-Care.jpg',
)
Breed.create(
 name: 'Cavalier King Charles Spaniel',
 life_expectancy:'12-15 years',
 personality:'affectionate, gracefull, gentle',
 shedding:'occasional',
 height:'12-13 inches',
 weight:'13-18 pounds',
 grooming:'weekly brushing',
 img_url:'http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12234930/Cavalier-King-Charles-Spaniel-MP.jpg',
)
Breed.create(
 name: 'Chihuahua',
 life_expectancy:'14-16 years',
 personality:'gracefull, charming, and sassy',
 shedding:'occasional',
 height:'5-8 inches',
 weight:'does not exceed 6 lbs',
 grooming:'occasional bath/brush',
 img_url:'http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12234721/Chihuahua-MP.jpg',
)
Breed.create(
 name: 'Chinese Crested',
 life_expectancy:'13-18 years',
 personality:'lively, alert, affectionate',
 shedding:'infrequent',
 height:'11-13 inches',
 weight:'8-12 pounds',
 grooming:'occasional bath/brush',
 img_url:'http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12234701/Chinese-Crested-Care.jpg',
)
Breed.create(
 name: 'English Toy Spaniel',
 life_expectancy:'10-12 years',
 personality:'gentile, playfull, inteligent',
 shedding:'seasonal',
 height:'9-10 inches',
 weight:'8-14 pounds',
 grooming:'2-3 times a week brushing',
 img_url:'http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12233529/English-Toy-Spaniel-Care.jpg',
)
Breed.create(
 name: 'Havanese',
 life_expectancy:'14-16 years',
 personality:'outgoing, funny, inteligent',
 shedding:'occasional',
 height:'8.5-11.5 inches',
 weight:'7-13 pounds',
 grooming:'2-3 times a week brushing',
 img_url:'http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12213608/Havanese-800x600.jpg',
)
Breed.create(
 name: 'Italian Grey Hound',
 life_expectancy:'14-15 years',
 personality:'sensitive, alert, playfull',
 shedding:'seasonal',
 height:'13-15 inches',
 weight:'7-14 pounds',
 grooming:'occasional bath/brush',
 img_url:'http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12231830/Italian-Greyhound-Care.jpg',
)
Breed.create(
 name: 'Japanese Chin',
 life_expectancy:'10-12 years',
 personality:'charming, loving, mobile',
 shedding:'seasonal',
 height:'8-11 inches',
 weight:'7-11 pounds',
 grooming:'weekly brushing',
 img_url:'http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12231733/Japanese-Chin-MP.jpg',
)
Breed.create(
 name: 'Maltese',
 life_expectancy:'12-15 years',
 personality:'gentile, playfull, charming',
 shedding:'infrequent',
 height:'7-9 inches',
 weight:'under 7 pounds',
 grooming:'daily brushing',
 img_url:'http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12231045/Maltese-Care.jpg',
)
Breed.create(
 name: 'Miniature Affenpinscher',
 life_expectancy:'12-16 years',
 personality:'proud, fearless fun-loving',
 shedding:'none',
 height:'10-12.5 inches',
 weight:'8-10 pounds',
 grooming:'occasion bath/brush',
 img_url:'http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12230745/Miniature-Pinscher-MP.jpg',
)
Breed.create(
 name: 'Papillon',
 life_expectancy:'14-6 years',
 personality:'happy, alert, friendly',
 shedding:'seasonal',
 height:'8-11 inches',
 weight:'5-10 pounds',
 grooming:'weekly brushing',
 img_url:'http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12230044/Papillon-MP.jpg',
)
Breed.create(
 name: 'Pekingese',
 life_expectancy:'12-14 years',
 personality:'affectionat, loyal, regal in manor',
 shedding:'seasonal',
 height:'6-9 inches',
 weight:'up to 14 pounds',
 grooming:'2-3 a week brushing',
 img_url:'http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12213908/Pekingnese-Care.jpg',
)
Breed.create(
 name: 'Pomeranian',
 life_expectancy:'12-16 years',
 personality:'lively, bold, inqusitive',
 shedding:'seasonal',
 height:'6-7 inches',
 weight:'3-7 pounds',
 grooming:'2-3 times a week brushing',
 img_url:'http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12225653/Pomeranian-Care.jpg',
)
Breed.create(
 name: 'Pug',
 life_expectancy:'13-15 years',
 personality:'loving, charming, mischievous',
 shedding:'regularly',
 height:'10-13 inches',
 weight:'14-18 pounds',
 grooming:'weekly brushing',
 img_url:'http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12225427/Pug-Care.jpg',
)
Breed.create(
 name: 'Shih Tzu',
 life_expectancy:'10-18 years',
 personality:'outgoing, affectionate, playfull',
 shedding:'infrequent',
 height:'9-10.5 inches',
 weight:'9-16 pounds',
 grooming:'daily brushing',
 img_url:'http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12224359/Shih-Tzu-Care.jpg',
)
Breed.create(
 name: 'Silky Terrier',
 life_expectancy:'13-15 years',
 personality:'keenly alert, friendly, quick',
 shedding:'occasional',
 height:'9-10 inches',
 weight:'around 10 pounds',
 grooming:'2-3 times a week brushing',
 img_url:'http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12224155/Silky-Terrier-Care.jpg',
)
Breed.create(
 name: 'Yorkshire Terrier',
 life_expectancy:'11-15 years',
 personality:'sprightly, tomboyish, affectionate',
 shedding:'infrequent',
 height:'7-8 inches',
 weight:'7 pounds',
 grooming:'specialty/proffesional',
 img_url:'http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12222717/Yorkshire-Terrier-Care.jpg',
)
b1 = Breed.create(
 name: 'Toy Fox Terrier',
 life_expectancy:'13-15 years',
 personality:'inteligent, alert, friendly',
 shedding:'occasional',
 height:'8.5-11.5 inches',
 weight:'3.5-7 pounds',
 grooming:'weekly brushing',
 img_url:'http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12223439/Toy-Fox-Terrier-Care.jpg',
)
u1 = User.create(email: "asd@gmail.com", encrypted_password: "fsrtdr", password: "fsrtdr", sign_in_count: 1, created_at: Time.now, updated_at: Time.now )
r1 = Review.create(breed: b1, user: u1, kid_friendly: 6, dog_friendly: 9, barking_lvl: 3, trainability: 8, energy_lvl: 6, body: "great dog")
