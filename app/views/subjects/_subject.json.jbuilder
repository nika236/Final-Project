json.extract! subject, :id, :name, :description, :lecturer_id, :created_at, :updated_at
json.url subject_url(subject, format: :json)
