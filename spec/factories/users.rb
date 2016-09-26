FactoryGirl.define do
  factory :user do
    email 'test.user@prnewswire.com'
    password 'Password1!'
    confirmed_at          Time.now

    trait :admin_adv do
      role 'admin_adv'
    end

  end

end
