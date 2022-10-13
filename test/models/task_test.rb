require "test_helper"

class TaskTest < ActiveSupport::TestCase
  def setup
    @task = Task.new
  end

  def error_messages
    @task.errors&.full_messages
  end

  test "should not be valid without a title" do
    assert_not @task.valid?
    assert_includes(error_messages, "Title can't be blank")
  end
end
