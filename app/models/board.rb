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
end
