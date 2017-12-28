class User < ApplicationRecord

  def self.test_user

    User.find(5)

  end

end
