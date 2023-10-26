class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  delegate :city, to: :doctor
end
