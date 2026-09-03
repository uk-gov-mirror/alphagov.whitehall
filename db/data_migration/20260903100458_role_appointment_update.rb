Person.all.find_each do |person|
  current_role_appointments = person.current_role_appointments
  current_role_appointments.each do |role_appointment|
    role_appointment.save!
    role_appointment.role.save!
  end
end
