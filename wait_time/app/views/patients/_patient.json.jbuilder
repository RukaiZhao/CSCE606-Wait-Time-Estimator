json.extract! patient, :id, :name, :number, :created_at, :updated_at
json.url patient_url(patient, format: :json)
