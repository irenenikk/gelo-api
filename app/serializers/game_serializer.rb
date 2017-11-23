class GameSerializer < ActiveModel::Serializer
  attributes :result, :white, :black, :created_at, :confirmed
end
