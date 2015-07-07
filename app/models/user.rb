# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base

      has_many :spendings

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

      def get_spending_cost_of_month
        @spendings = Spending.where('created_at BETWEEN ? AND ?', Time.now.beginning_of_month, Time.now.end_of_month)
        cost = 0
        @spendings.each do |expense|
          cost += expense.cost_cents
        end
        cost
      end

      def get_spendings_of_month
        month_spendings = Spending.where('created_at BETWEEN ? AND ?', Time.now.beginning_of_month, Time.now.end_of_month)
      end

      private

        def create_remember_token
          self.remember_token = User.digest(User.new_remember_token)
        end

end
