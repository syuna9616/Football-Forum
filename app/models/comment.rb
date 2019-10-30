# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  comment    :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint
#  user_id    :bigint           not null
#
# Indexes
#
#  fk_rails_03de2dc08c         (user_id)
#  index_comments_on_board_id  (board_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#  fk_rails_...  (user_id => users.id)
#

class Comment < ApplicationRecord
  belongs_to :board
  belongs_to :user

  validates :comment, presence: true, length: { maximum: 1000 }
end
