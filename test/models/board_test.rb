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

require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
