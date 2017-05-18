RSpec.shared_context "Requests" do
  let(:user){ create(:user) }
  subject { response }

  def authenticate(u = user)
    login_as(u)
  end
end

RSpec.shared_examples "requires authentication" do
  it { should redirect_to new_user_session_path }
end


RSpec.configure do |config|
  config.include_context "Requests", type: :request
end
