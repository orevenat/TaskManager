require 'test_helper'

class Api::V1::TasksControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index, params: { format: :json }
    assert_response :success
  end

  test 'should get show' do
    author = create(:manager)
    task = create(:task, author: author)
    get :show, params: { id: task.id, format: :json }
    assert_response :success
  end

  test 'should post create' do
    author = create(:manager)
    sign_in(author)
    assignee = create(:developer)
    task_attributes = attributes_for(:task).
      merge({ assignee_id: assignee.id })
    post :create, params: { task: task_attributes, format: :json }
    assert_response :created

    data = JSON.parse(response.body)
    created_task = Task.find(data['task']['id'])

    assert created_task.present?
    assert_equal task_attributes.stringify_keys, created_task.slice(*task_attributes.keys)
  end

  test 'should put update' do
    author = create(:manager)
    assignee = create(:developer)
    task = create(:task, author: author)
    task_attributes = attributes_for(:task).except(:expired_at).
      merge({ author_id: author.id, assignee_id: assignee.id }).
      stringify_keys

    patch :update, params: { id: task.id, format: :json, task: task_attributes }
    assert_response :success

    task.reload
    assert_equal task_attributes, task.slice(*task_attributes.keys)
  end

  test 'should delete destroy' do
    task = create(:task)
    delete :destroy, params: { id: task.id, format: :json }
    assert_response :success

    assert !Task.where(id: task.id).exists?
  end
end
