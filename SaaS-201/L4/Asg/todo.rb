require "active_record"

class Todo < ActiveRecord::Base
  def self.add_task(task)
    text = task[:todo_text]
    date = Date.today + task[:due_in_days]
    create!({ todo_text: text, due_date: date, completed: false })
  end

  def self.mark_as_complete!(todo_id)
    todo = find(todo_id)
    todo.completed = true
    todo.save
    todo
  end

  def to_displayable_string
    status = completed ? "X" : " "
    date = due_date == Date.today ? "" : due_date
    "#{id}. [#{status}] #{todo_text} #{date}"
  end

  def self.show_list
    puts "My Todo-list\n\n"

    puts "Overdue\n"
    puts where("due_date < ?", Date.today).map { |todo| todo.to_displayable_string }
    puts "\n\n"

    puts "Due Today\n"
    puts where("due_date = ?", Date.today).map { |todo| todo.to_displayable_string }
    puts "\n\n"

    puts "Due Later\n"
    puts where("due_date > ?", Date.today).map { |todo| todo.to_displayable_string }
    puts "\n\n"
  end
end
