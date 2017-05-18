require 'rails_helper'



RSpec.describe "Posts", type: :request do

  describe "GET /posts" do
    let!(:posts) { create_list(:post, 3) }
    before { get '/posts' }
    it { should be_successful }
  end

  describe "GET /posts/:id" do
    let!(:post) { create(:post) }
    before { get post_path(post) }
    it { should be_successful }
  end

  describe "GET /posts/new" do
    include_examples "requires authentication" do
      before { get new_post_path }
    end

    context "when signed in" do
      before do
        authenticate
        get new_post_path
      end
      it { should be_successful }
    end
  end

  describe "POST /posts" do
    let(:attributes) { attributes_for :post }

    include_examples "requires authentication" do
      before { post posts_path, params: { post: attributes } }
    end

    it "requires authentication" do
      post posts_path, params: { post: attributes }
      expect(response).to redirect_to new_user_session_path
    end

    context "when signed in" do
      before { authenticate }

      context "with valid params" do
        it "creates a post" do
          expect {
            post posts_path, params: { post: attributes }
          }.to change(Post, :count).by(+1)
        end
        it "redirects to post" do
          post posts_path, params: { post: attributes }
          expect(response).to redirect_to Post.last
        end
      end

      context "with invalid params" do
        it "does not create a post" do
          expect {
            post posts_path, params: { post: { title: ' ' } }
          }.to_not change(Post, :count)
        end
      end

    end
  end

  describe "GET /posts/:post_id/edit" do
    let!(:post) { create(:post, author: user) }

    include_examples "requires authentication" do
      before { get edit_post_path(post) }
    end

    context "does not allow users other than the author" do
      before do
        authenticate(create(:user))
        get edit_post_path(post)
      end
      it { should have_http_status :unauthorized }
    end

    context "when signed in as author" do
      before do
        authenticate
        get edit_post_path(post)
      end

      it { should be_successful }
    end
  end

  describe "PATCH /posts/:post_id" do
    let!(:post) { create(:post, author: user) }
    let(:attrs) { attributes_for(:post) }
    include_examples "requires authentication" do
      before { patch post_path(post), params: { post: attrs } }
    end

    context "does not allow users other than the author" do
      before do
        authenticate(create(:user))
        patch post_path(post), params: { post: attrs }
      end
      it { should have_http_status :unauthorized }
    end

    context "when signed in as author" do
      before { authenticate }

      context "with valid params" do
        before { patch post_path(post), params: { post: attrs } }
        it "updates the post" do
          post.reload
          expect(post.title).to eq attrs[:title]
          expect(post.body).to eq attrs[:body]
        end
      end

      context "with invalid params" do
        before { patch post_path(post), params: { post: { title: ' ', body: ' ' } } }
        it "does not update the post" do
          expect { post.reload }.to_not change(post, :title)
          expect(response).to have_http_status :unprocessable_entity
        end
      end
    end
  end
end
