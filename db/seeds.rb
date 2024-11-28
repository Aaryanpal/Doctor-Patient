Role.create(name: 'doctor')
Role.create(name: 'receptionist')


user =  User.create(email: "doctor@gmail.com", password: "password")
user.add_role :admin

user = User.create(email: "reception@gmail.com", password: "password")
user.add_role :receptionist




10.times do |i|
 Patient.create(first_name: "First Name #{i}", last_name: "Last name #{i}", created_by: 2, created_at: Time.now + i.day)
end