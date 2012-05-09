module Uniqblog::Stubs
  def stub_auth(user=nil)
    user ||= Factory(:user)
    controller.stub!(:current_user).and_return(user)

    sign_in user
  end

  def stub_admin
    User.any_instance.stub(:set_as_admin).and_return
  end
end
