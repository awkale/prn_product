FactoryGirl.define do
  factory :user do
    email 'test.user@prnewswire.com'
    password 'Password1!'
    confirmed_at          Time.now

    trait :admin do
      role 'admin'
    end

  end

end
