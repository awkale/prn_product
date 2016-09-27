FactoryGirl.define do
  factory :user do
    email 'test.user@prnewswire.com'
    password 'Password1!'
    confirmed_at          Time.now

    trait :admin_adv do
      role 'admin_adv'
    end

    trait :admin_super do
      role 'admin_super'
    end

  end

end
