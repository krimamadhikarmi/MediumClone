# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  title       :string(255)
#  description :text(65535)
#  user_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
