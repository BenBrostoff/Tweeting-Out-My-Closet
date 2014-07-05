helpers do

  require 'digest/md5'

  def gravatar_hash(email)
    Digest::MD5.hexdigest(email.downcase.strip)
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

end
