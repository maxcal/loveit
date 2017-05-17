require 'rails_helper'

RSpec.describe "Posts", type: :request do

  subject { response }

  describe "GET /posts" do
    let!(:posts) {}
    before { get '/posts' }
    it { should be_successful }
  end
end
