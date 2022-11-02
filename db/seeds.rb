# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create an Admin
admin1 = User.create!(
    username: "admin",
    contact: "1234567890",
    email: "adminuser@test.com",
    password: "password",
    password_confirmation: "password"
)
admin1.toggle!(:is_admin)

# # Create Users
user1 = User.create!(
    username: "user1",
    contact: "0123456789",
    email: "user100@test.com",
    password: "password",
    password_confirmation: "password"
)

user2 = User.create!(
    username: "user2",
    contact: "9876543210",
    email: "user2@test.com",
    password: "password",
    password_confirmation: "password"
)

# Create Hotel
hotel1 = Hotel.create!(
    hotelname: "The leela Palace",
    about: "Think big when it comes to the Maximum City- this 5-star prperty is laid out amid several acers of
    landscaped gardens, waterfalls and lotus filled fountains. Located a mere 5 minutes from the Mumbai International airpot." ,
    city: "Mumbai",
    address: "Bandra Kurla Complex, Bandra East, Mumbai, Maharashtra 400051",
    latitude: 19.060850,
    longitude: 72.858910
)
hotel1.image.attach(io: File.open("app/assets/images/hotelseed/hotel6.jpg"), filename: "hotel6.jpg")


hotel2 = Hotel.create!(
    hotelname: "The JW Marriott Hotel",
    about: "Experience the resplendent JW Marriott Hotel Kolkata,
    a 5-star accommodation with understated elegance and sophistication. 
    Located 16 kilometers from Netaji Subhash Chandra Bose Airport.",
    city: "Kolkata",
    address: "Jawaharlal Nehru Road, Kolkata, West Bengal 700071",
    latitude: 22.553440,
    longitude: 88.349520
)
hotel2.image.attach(io: File.open("app/assets/images/hotelseed/hotel3.jpg"), filename: "hotel3.jpg")


hotel3 = Hotel.create!(
    hotelname: "The Oberoi, Gurgaon",
    about: "The alluring fragrances and decorations of the rooms will want you never to leave your space.
    Catch jaw-dropping city views from elegantly decorated balconies or relax by the indoor pool.",
    city: "Gurgaon",
    address: "Sector 29, Gurgaon, Haryana 122002",
    latitude: 28.459490,
    longitude: 77.026630
)
hotel3.image.attach(io: File.open("app/assets/images/hotelseed/hotel8.jpg"), filename: "hotel8.jpg")

# Create RoomTypes
roomtype1 = Roomtype.create!(
    roomtypename: "Luxury Suite",
    description: "Lavish bathrooms with upscale features such as heated floors and 
    soaking tubs. High-end, lush linens and towels. Deluxe pillows and mattresses so your sleeping hours are as blissful as your waking ones."
)

roomtype2 = Roomtype.create!(
    roomtypename: "Deluxe Room",
    description: "The deluxe rooms are spacious and yet have a cozy and 
    charming vintage vibe. Thoughtfully designed for a comfortable stay, 
    these rooms boast of elegant wooden furniture complemented with warm upholstery, state of the art amenities and a spacious,
    fully equipped bathroom."
)

roomtype3 = Roomtype.create!(
    roomtypename: "President Suite",
    description: "The lavish 120 sqm two-bedroom Presidential Suite provides the ultimate luxurious living experience.
    The spacious suite is furnished with top-quality furniture, creating an extravagant ambience with impressive facilities
    and bespoke services."
)

# Create Rooms for hotel 1
room1 = Room.create!(
    hotel_id: hotel1.id,
    roomtype_id: roomtype1.id,
    price: 10000,
    total_rooms: 6
)
room1.image.attach(io: File.open("app/assets/images/roomseed/room1.jpg"), filename: "room1.jpg")


room2 = Room.create!(
    hotel_id: hotel1.id,
    roomtype_id: roomtype2.id,
    price: 5000,
    total_rooms: 5
)
room2.image.attach(io: File.open("app/assets/images/roomseed/room2.jpg"), filename: "room2.jpg")

room6 = Room.create!(
    hotel_id: hotel1.id,
    roomtype_id: roomtype3.id,
    price: 15000,
    total_rooms: 4
)
room6.image.attach(io: File.open("app/assets/images/roomseed/room3.jpg"), filename: "room3.jpg")


# Create Rooms for hotel 2
room9 = Room.create!(
    hotel_id: hotel2.id,
    roomtype_id: roomtype1.id,
    price: 10000,
    total_rooms: 4
)
room9.image.attach(io: File.open("app/assets/images/roomseed/room4.jpg"), filename: "room4.jpg")

room11 = Room.create!(
    hotel_id: hotel2.id,
    roomtype_id: roomtype2.id,
    price: 5000,
    total_rooms: 5
)
room11.image.attach(io: File.open("app/assets/images/roomseed/room5.jpg"), filename: "room5.jpg")

room13 = Room.create!(
    hotel_id: hotel2.id,
    roomtype_id: roomtype3.id,
    price: 15000,
    total_rooms: 3
)
room13.image.attach(io: File.open("app/assets/images/roomseed/room6.jpg"), filename: "room6.jpg")


# Create Rooms for hotel 3
room15 = Room.create!(
    hotel_id: hotel3.id,
    roomtype_id: roomtype1.id,
    price: 10000,
    total_rooms: 8
)
room15.image.attach(io: File.open("app/assets/images/roomseed/room7.jpg"), filename: "room7.jpg")

room17 = Room.create!(
    hotel_id: hotel3.id,
    roomtype_id: roomtype2.id,
    price: 5000,
    total_rooms: 5
)
room17.image.attach(io: File.open("app/assets/images/roomseed/room8.jpg"), filename: "room8.jpg")

room20 = Room.create!(
    hotel_id: hotel3.id,
    roomtype_id: roomtype3.id,
    price: 15000,
    total_rooms: 7
)
room20.image.attach(io: File.open("app/assets/images/roomseed/room9.jpg"), filename: "room9.jpg")



