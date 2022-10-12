require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:one)
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
    assert_selector "h1", text: "New task"
    fill_in "task_title", with: "new todo"
    click_on "Create Task"

    assert_text "Task was successfully created"
    assert_text "new todo"
  end

  test "should update Task" do
    assert_not @task.complete?
    visit root_url
    click_on @task.title, match: :first

    assert_text "Task was successfully completed."
    assert_predicate @task.reload, :complete?
  end

  test "should destroy Task" do
    visit root_url
    click_on "Delete", match: :first

    assert_text "Task was successfully destroyed"
  end
end
