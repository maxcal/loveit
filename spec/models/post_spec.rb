require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:author).class_name('User')}
end
