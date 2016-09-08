class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :first_name, use: :slugged

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
