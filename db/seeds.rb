require 'factory_bot_rails'

User.create!(name: 'admin',
             email: 'admin@example.com',
             password: 'foobar',
             password_confirmation: 'foobar',
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

10.times do
  FactoryBot.create(:task)
end
