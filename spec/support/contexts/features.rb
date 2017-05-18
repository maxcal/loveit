RSpec.shared_context "Features" do
  let(:user){ create(:user) }
end

RSpec.configure do |config|
  config.include_context "Features", type: :feature
end
