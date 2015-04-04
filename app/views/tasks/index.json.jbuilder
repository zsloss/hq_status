json.array!(@tasks) do |task|
  json.extract! task, :id, :flow, :product, :doc_type, :start_date, :priority, :status, :region, :done, :draft, :draft_submitted, :completion_date, :notes
  json.url task_url(task, format: :json)
end
