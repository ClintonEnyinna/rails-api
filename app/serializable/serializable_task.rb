class SerializableTask < JSONAPI::Serializable::Resource
  type 'tasks'

  attributes :title, :completed, :note
end
