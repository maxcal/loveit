require 'rails_helper'
require 'pundit/rspec'

RSpec.describe PostPolicy, type: :policy do

  let(:user) { User.new }

  subject { described_class }

  permissions ".scope" do
    it "allows all the posts" do
      expect(policy_scope(User.new).resolve).to eq Post.all
    end
  end

  permissions :show? do
    it "allows posts to be viewed" do
      expect(subject).to permit(User.new, Post.new)
    end
  end

  permissions :create? do
    it "allows any user to be create posts" do
      expect(subject).to permit(User.new)
    end
  end

  permissions :update? do
    it "does not allow any user to update posts" do
      expect(subject).to_not permit(User.new, Post.new)
    end
    it "does not allow any user to update posts" do
      post = Post.new(author: User.new)
      expect(subject).to permit(post.author, post)
    end
  end

  permissions :destroy? do
    it "does not allow any user to destroy posts" do
      expect(subject).to_not permit(User.new, Post.new)
    end
    it "does not allow any user to update posts" do
      post = Post.new(author: User.new)
      expect(subject).to permit(post.author, post)
    end
  end
end
