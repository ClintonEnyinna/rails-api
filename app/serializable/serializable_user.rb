class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attribute :email

  attribute :auth_token do
    JsonWebToken.encode(user_id: @object.id)
  end
end
