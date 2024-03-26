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
class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :photo

  validates :photo, :user_id, presence: true

  validates :title, presence: true, length: { minimum: 30 }

  validates :description, presence: true, length: { minimum: 100 }

end
