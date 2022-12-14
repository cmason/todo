require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post tasks_url, params: {task: {complete: @task.complete, title: @task.title}}
    end

    assert_redirected_to root_url
  end

  test "should return 422 status if can't create task" do
    post tasks_url, params: {task: {complete: nil, title: nil}}
    assert_response :unprocessable_entity
  end

  test "should update task" do
    patch task_url(@task), params: {task: {complete: @task.complete, title: @task.title}}
    assert_redirected_to root_url
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete task_url(@task)
    end

    assert_redirected_to root_url
  end
end
