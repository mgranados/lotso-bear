class User < ActiveRecord::Base
      before_save { self.email = email.downcase }
      before_create :create_remember_token

      validates :name, presence: true, length: { maximum: 50 }
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
      validates :email, presence: true,
                format: { with: VALID_EMAIL_REGEX },
                uniqueness:{ case_sensitive: false }

      # VALID_PRIV_REGEX = /\A\w+\z/  que sea una palabra
      validates :privileges, presence: true, inclusion: { in: ApplicationHelper::PRIVS, message: "%{value} is not a valid size" }
      validates :username, presence: true
      validates :password, length: { minimum: 5 }

      has_secure_password

      def User.new_remember_token
        SecureRandom.urlsafe_base64
      end

      def User.digest(token)
        Digest::SHA1.hexdigest(token.to_s)
      end

      private

        def create_remember_token
          self.remember_token = User.digest(User.new_remember_token)
        end

end
