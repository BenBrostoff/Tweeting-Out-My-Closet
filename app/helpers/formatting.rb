helpers do

  require 'digest/md5'

    def em(text)
      "<em>#{text}</em>"
    end

    def gravatar_hash(email)
      Digest::MD5.hexdigest(email.downcase.strip)
    end

end
