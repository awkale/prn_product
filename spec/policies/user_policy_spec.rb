require 'rails_helper'

describe UserPolicy do
  subject { UserPolicy}

  let (:current_user) { FactoryGirl.build_stubbed :user }
  let (:other_user) { FactoryGirl.build_stubbed :user }
  let (:admin_adv) { FactoryGirl.build_stubbed :user, :admin_adv }
  let (:admin_super) { FactoryGirl.build_stubbed :user, :admin_super }

  permissions :index? do
    it 'denies access if not an admin_adv' do
      expect(UserPolicy).not_to permit(current_user)
    end
    it 'allows access for an admin_adv' do
      expect(UserPolicy).to permit(admin_adv)
    end
  end

  permissions :show? do
    it "prevents other users from seeing your profile" do
      expect(subject).not_to permit(current_user, other_user)
    end
    it "allows you to see your own profile" do
      expect(subject).to permit(current_user, current_user)
    end
    it "allows an admin_adv to see any profile" do
      expect(subject).to permit(admin_adv)
    end
  end

  permissions :update? do
    it "prevents updates if not an admin_super" do
      expect(subject).not_to permit(current_user)
    end
    it "allows an admin_super to make updates" do
      expect(subject).to permit(admin_super)
    end
  end

  permissions :destroy? do
    it "prevents deleting yourself" do
      expect(subject).not_to permit(current_user, current_user)
    end
    it "allows an admin_super to delete any user" do
      expect(subject).to permit(admin_super, other_user)
    end
  end

end