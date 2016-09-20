class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  def slug_candidates
     [
       :first_name,
       [:first_name, :last_name]
     ]
  end

  enum role: [:customer_basic, :customer_adv, :internal, :admin, :admin_adv, :admin_super]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
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
