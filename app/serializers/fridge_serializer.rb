class FridgeSerializer < ActiveModel::Serializer
    attributes :id, :brand, :last_technical_check

    has_one :user
  end