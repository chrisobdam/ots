  json.title @task.title
  json.notes @task.notes
  json.due_date @task.due_date
  json.assignees(@task.assignees) do |json, assignee|
    json.id assignee.user.identifier
    json.status assignee.status
  end
  json.listeners @task.listeners_array
  json.comments(@task.comments) do |json, comment|
    json.index comment.index
    json.comment comment.comment
    json.author comment.author.identifier
    json.date comment.date
  end  