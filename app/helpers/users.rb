helpers do 

  require 'digest/md5'

  def gravatar_hash(email)
    Digest::MD5.hexdigest(email.downcase.strip)
  end

  def current_user
  end
  
  def logged_in?
  end

end
