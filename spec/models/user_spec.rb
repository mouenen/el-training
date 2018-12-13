require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it 'is invalid without a name' do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'name should not be too long' do
    expect(FactoryBot.build(:user, name: 'a' * 21)).to_not be_valid
  end

  it 'is invalid without an email address' do
    user = FactoryBot.build(:user, email: ' ')
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is invalid with a duplicate email address' do
    FactoryBot.create(:user, email: 'user@example.com')
    user = FactoryBot.build(:user, email: 'user@example.com')
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end

  it 'email should not too long' do
    expect(FactoryBot.build(:user, email: 'a' * 255 + '@example')).to_not be_valid
  end

  it 'email validation should accept valid addresses' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      expect(FactoryBot.build(:user, email: valid_address)).to be_valid
    end
  end

  it 'email validation should reject invalid addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      expect(FactoryBot.build(:user, email: invalid_address)).to_not be_valid
    end
  end

  it 'password should be present (nonblank)' do
    user = FactoryBot.build(:user, password: ' ' * 6, password_confirmation: ' ' * 6)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it 'password should have a minimum length' do
    expect(FactoryBot.build(:user, password: 'a' * 5)).to_not be_valid
  end

  it 'authenticated? should return false for a user with nil digest' do
    user = FactoryBot.build(:user)
    user.valid?
    expect(user.authenticated?(:remember, '')).to_not be_truthy
  end

  it 'associated tasks should be destroyed' do
    user = FactoryBot.build(:user)
    user.valid?
    task1 = user.tasks.build(title: 'Test task1', content: 'My first test task.',
                             priority: 1, finished_at: Time.zone.now + 1.hour)
    task2 = user.tasks.build(title: 'Test task2', content: 'My second test task.',
                             priority: 2, finished_at: Time.zone.now + 1.hour)
    puts "This task1's user is #{task1.user.inspect}"
    puts "This task2's user is #{task2.user.inspect}"
    expect(user.tasks).to eq([task1, task2])
    user.destroy
    expect(task1).to be_nil
    expect(task2).to be_nil
  end

  it 'sends an activate email on account activation' do
    user = FactoryBot.create(:user)
    allow(UserMailer).to receive_message_chain(:account_activation, :deliver_now)
    expect(UserMailer).to have_received(:account_activation).with(user)
  end

  it 'sends a reset password email on reseting password' do
    user = FactoryBot.create(:user)
    expect(UserMailer.password_reset(user)).to have_received(:deliver_now)
  end
end
