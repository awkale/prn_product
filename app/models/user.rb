class User < ActiveRecord::Base

  enum role: {
    admin_super: 0,
    admin_adv: 1,
    admin: 2,
    user_internal: 3,
    customer_adv: 4,
    customer_basic: 5
  }
  after_iniialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  def slug_candidates
     [
       :first_name,
       [:first_name, :last_name]
     ]
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :lockable

  default_scope { order('email')}

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  validate :password_complexity
    def password_complexity
      if password.present?
         if !password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*(_|[^\w])).+$/)
           errors.add :password, "Password complexity requirement not met"
         end
      end
    end
end
