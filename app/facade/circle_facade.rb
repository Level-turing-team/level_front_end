class CircleFacade
  def self.create_user_circle(user_id, following_id)
    BackendService.create_user_circle(user_id, following_id)
  end
end