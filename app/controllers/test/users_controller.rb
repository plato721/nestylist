# !!! skips authentication by inheriting from TestController
class Test::UsersController < Test::TestController
  def destroy_username
    user = User.find_by(username: params[:username])
    user_deleted = user&.destroy

    if (!user || user_deleted)
      render json: { status: 200, body: '' }
    else
      render json: { status: 422 }
    end
  end
end
