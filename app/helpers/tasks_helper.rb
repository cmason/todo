module TasksHelper
  def task_checkbox(is_complete)
    tag.i class: "material-icons" do
      "radio_button_#{is_complete ? "checked" : "unchecked"}"
    end
  end

  def task_text(task)
    return task.title unless task.complete?
    tag.s class: "has-text-grey" do
      task.title
    end
  end
end
