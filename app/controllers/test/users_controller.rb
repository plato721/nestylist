# !!! skips authentication by inheriting from TestController
class Test::UsersController < Test::TestController
  def clear_users
    User.where.not(username: 'super_admin')
        .destroy_all

    render json: { status: 200, body: '' }
  end

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
