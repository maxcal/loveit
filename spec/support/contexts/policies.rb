RSpec.shared_context "Policies" do
  subject { described_class }
  let(:model_class) { described_class.to_s.chomp('Policy').constantize }
  let(:user) { User.new }
  let(:permitted_attributes) { described_class.new(user, model_class).permitted_attributes }
  def policy_scope(user)
    described_class::Scope.new(user, model_class)
  end
end

RSpec.configure do |config|
  config.include_context "Policies", type: :policy
end
