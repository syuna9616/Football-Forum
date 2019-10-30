# == Schema Information
#
# Table name: boards
#
#  id          :bigint           not null, primary key
#  body        :text(65535)      not null
#  title       :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#  user_id     :bigint           not null
#
# Indexes
#
#  fk_rails_0732f8ef3d          (user_id)
#  index_boards_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (user_id => users.id)
#

class Board < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :category
  belongs_to :user

  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true
end
