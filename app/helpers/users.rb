helpers do

  require 'digest/md5'

  def gravatar_hash(email)
    Digest::MD5.hexdigest(email.downcase.strip)
  end

  def current_user
    user ||= User.find(session[:user_id])
  end

  def logged_in?
    current_user
  end

end
