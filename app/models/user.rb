
# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base

      has_many :spendings
      has_many :delays

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

      def self.import(file)
        Spreadsheet.client_encoding = 'UTF-8'
        ejemplo = Spreadsheet.open file.path
        sheet2 = ejemplo.worksheet 2
        monthRegex = Regexp.new('time="([^"]*)"')
        id_tardiness_regex = Regexp.new('id="([^"]*)".{1,150}MINUTOS TARDE(\d*\.{0,1}\d*)')
        year = sheet2.rows.join[/time="(\d{4})-(\d{2})/,1]
        month = sheet2.rows.join[/time="(\d{4})-(\d{2})/,2]
        attendances = Hash.new([])
        attendances = sheet2.rows.join.scan(id_tardiness_regex)

        ActiveRecord::Base.transaction do
          attendances.each do |key,value|
            user = User.find_by_clock_id(key).blank? ? nil : User.find_by_clock_id(key)
            exist = user.nil? ? true : Delay.exists?(year: year, month: month, user_id: user.id)
            Delay.create(user_id: user.id, year: year, month: month, minutes_late: value) if !user.nil? and !exist
          end
        end
      end

      def delay_this_month(month,year)
        minutes_late = self.delays.where(month: month, year: year).first.nil? ? "No hay entrada de este mes" : self.delays.where(month: month, year: year).first.minutes_late
      end

      private

        def create_remember_token
          self.remember_token = User.digest(User.new_remember_token)
        end

end
