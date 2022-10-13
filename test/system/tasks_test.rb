require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = Task.ordered.first
  end

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: "Todos"
    assert_selector "span", text: "New Task"
    assert_text @task.title
  end

  test "should create task" do
    visit root_url
    assert_selector "h1", text: "Todos"

    click_on "New Task"
    fill_in "task_title", with: "new todo"
    assert_not page.current_path == "/tasks/new"
    click_on "Create Task"

    assert_selector "main", class: "container"
    assert_text "new todo"
  end

  test "should complete Task" do
    assert_not @task.complete?
    assert_no_selector "s", text: @task.title
    visit root_url
    click_on @task.title, match: :first
    assert_selector "s", text: @task.title
  end

  test "should destroy Task" do
    visit root_url
    assert_text @task.title
    click_on "Delete", match: :first
    assert_no_text @task.title
  end
end
