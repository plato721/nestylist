# !!! skips authentication by inheriting from ActionController::Base
class Test::TestController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :crash_if_not_test

  private
  def crash_if_not_test
    if !(Rails.env.development? || Rails.env.test?)
      raise SecurityError, "Verbotten"
    end
  end
end