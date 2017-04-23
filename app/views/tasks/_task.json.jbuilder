json.extract! task, :id, :list_id, :text, :active, :created_at, :updated_at
json.url task_url(task, format: :json)
