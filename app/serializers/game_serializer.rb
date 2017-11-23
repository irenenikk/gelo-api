class GameSerializer < ActiveModel::Serializer
  attributes :id, :result, :white, :black, :created_at, :confirmed, :added_by, :won

  # 1 if won, -1 if lost, 0 if draw
  def won
    if (object.result == 1 and object.white == current_user) or (object.result == -1 and object.black == current_user)
      return 1
    elsif object.result == 0
      return 0
    end
    -1
  end
end
