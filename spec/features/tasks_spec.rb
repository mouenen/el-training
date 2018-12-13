require 'rails_helper'

RSpec.feature 'Tasks', type: :feature do
  let(:task) { FactoryBot.create(:task) }

  scenario 'index' do
    visit tasks_path
    click_link 'タイトル'
    click_link '優先順位'
    click_link '完成時間'
    click_link '状態'
    click_link 'タスク新規'
  end
  # scenario 'new' do
  #   visit new_task_path
  #   fill_in 'タイトル', with: 'test1'
  #   fill_in '内容', with: 'My test task.'
  #   select '中', from: '優先順位'
  #   find('#datetimepicker').find('.input-group-addon').find('.glyphicon-calendar').click
  #   click_button '作成'
  #   expect(page).to have_current_path "/tasks/#{task.id}"
  # end
  scenario 'edit' do
    visit edit_task_path(task.id)
    fill_in 'タイトル', with: 'test1'
    fill_in '内容', with: 'My test task.'
    select '中', from: '優先順位'
    find('#datetimepicker').find('.input-group-addon').find('.glyphicon-calendar').click
    select '着手中', from: '状態'
    click_button '更新'
    expect(page).to have_current_path "/tasks/#{task.id}"
  end
  scenario 'show' do
    visit "tasks/#{task.id}"
    click_link 'タスク一覧画面を戻る'
  end
  # scenario 'delete' do
  #   visit tasks_path
  #   find_link('削除').click
  # end
end
