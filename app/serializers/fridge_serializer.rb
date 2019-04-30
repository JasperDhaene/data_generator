class FridgeSerializer < ActiveModel::Serializer
    attributes :id, :brand, :last_technical_check, :user_id
  end