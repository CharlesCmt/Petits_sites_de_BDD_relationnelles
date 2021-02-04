# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
#Speciality.destroy_all
#City.destroy_all


space = ["Cardiologie", "Dermatologie", "Gynécologie", "Généraliste"]
space.each{ |index| Speciality.create(spe_name: index) }


50.times do
    spx = Speciality.find(rand(1..4))
    Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, speciality: spx, zip_code: Faker::Address.zip_code)
end

20.times do
    City.create(city: Faker::Address.city)
  end

  400.times do
    Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

200.times do
    d = Doctor.sample
    p = Patient.sample
    c = City.sample
    Appointment.create(
      doctor_id: d,
      patient_id: p,
      city_id: c,
      date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 100))
  end
