# == Schema Information
#
# Table name: board_category_relations
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  board_id    :bigint
#  category_id :bigint
#
# Indexes
#
#  index_board_category_relations_on_board_id     (board_id)
#  index_board_category_relations_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#  fk_rails_...  (category_id => categories.id)
#

class BoardCategoryRelation < ApplicationRecord
  belongs_to :board
  belongs_to :category
end
