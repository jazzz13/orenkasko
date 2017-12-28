class User < ApplicationRecord

  TEST_ID = 5

  def self.test_user

    User.find(TEST_ID)

  end

end
