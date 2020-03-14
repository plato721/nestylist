# DOES NOT REQUIRE AUTHENTICATION by skipping inheritance
# of ApplicationController
class LandingController < ActionController::Base
  layout 'application.html.erb'

  def begin
  end
end
