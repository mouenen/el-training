require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:task)).to be_valid
  end

  it 'user id should be present' do
    task = FactoryBot.build(:task, user_id: nil)
    task.valid?
    expect(task.errors[:user_id]).to include("can't be blank")
  end

  it 'title should be present' do
    task = FactoryBot.build(:task, title: nil)
    task.valid?
    expect(task.errors[:title]).to include("can't be blank")
  end

  it 'title should not be too short' do
    expect(FactoryBot.build(:task, title: 'a' * 2)).to_not be_valid
  end

  it 'title should not be too long' do
    expect(FactoryBot.build(:task, title: 'a' * 31)).to_not be_valid
  end

  it 'priority should between 1 to 3' do
    expect(FactoryBot.build(:task, priority: 0)).to_not be_valid
    expect(FactoryBot.build(:task, priority: 4)).to_not be_valid
  end

  it 'status should between 0 to 2' do
    expect(FactoryBot.build(:task, status: -1)).to_not be_valid
    expect(FactoryBot.build(:task, status: 3)).to_not be_valid
  end

  it 'finished_at should later than created_at' do
    expect(FactoryBot.build(:task, created_at: Time.zone.now + 1.hour, finished_at: Time.zone.now)).to_not be_valid
  end
end
