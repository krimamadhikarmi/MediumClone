# == Schema Information
#
# Table name: comments
#
#  id          :bigint           not null, primary key
#  description :text(65535)
#  user_id     :bigint           not null
#  post_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :description, presence: true
end


