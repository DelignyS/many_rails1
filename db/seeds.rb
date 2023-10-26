# Clean the database
Appointment.destroy_all
Doctor.destroy_all
Patient.destroy_all
City.destroy_all

# Create cities
cities = []
10.times do
  cities << City.create(name: Faker::Address.city)
end

# Create doctors
10.times do
  city = cities.sample
  Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    zip_code: Faker::Address.zip_code,
    city: city
  )
end

# Create patients
10.times do
    Patient.create(
    city_id: City.all.sample.id,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

# Create appointments
15.times do

  Appointment.create(
    date: Faker::Time.between_dates(from: Date.today, to: 1.year.from_now, period: :all),
    doctor_id: Doctor.all.sample.id,
    patient_id: Patient.all.sample.id,
    city_id: City.all.sample.id
  )
end

puts "Seed data created successfully."
