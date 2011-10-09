class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_users_list

  protected

  def not_authenticated
    redirect_to login_url, :alert => "First login to access this page."
  end

  # Generate random id with strings and numbers
  def generate_random_id
      len = 8
      chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
      newpass = ""
      1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
      return newpass
  end

end
