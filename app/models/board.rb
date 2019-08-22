# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  title      :string(255)      not null
#  body       :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Board < ApplicationRecord
  has_many :comments
  has_many :board_category_relations
  has_many :categories, through: :board_category_relations

  validates :name, presence: true, length: { maximum: 8 }
  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 1000 }
end
