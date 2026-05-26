users = [
  { email: 'admin@example.com', username: 'admin' },
  { email: 'alice@example.com', username: 'alice' },
  { email: 'bob@example.com', username: 'bob' },
  { email: 'charlie@example.com', username: 'charlie' },
  { email: 'diana@example.com', username: 'diana' }
]

users.each do |attributes|
  user = User.find_or_initialize_by(email: attributes[:email])
  user.assign_attributes(attributes.merge(password: 'password123', password_confirmation: 'password123'))
  user.save!
end
