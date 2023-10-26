
require 'faker'


10.times do
  Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    specialty: Faker::Lorem.word,
    zip_code: Faker::Address.zip_code
  )
end


10.times do
  Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end


10.times do
  Appointment.create(
    date: Faker::Time.forward(days: 30),
    doctor: Doctor.all.sample,
    patient: Patient.all.sample
  )
end
