FactoryGirl.define do
  factory :product_line do
    product_line "MyString"
    parent_id 1
    lft 1
    rgt 1
    depth 1
    children_count 1
  end
end
