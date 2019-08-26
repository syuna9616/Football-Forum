# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env == "development"
  Category.create([
    { name: "Jリーグ" },
    { name: "ラ・リーガ" },
    { name: "プレミアリーグ" },
    { name: "ブンデスリーガ" },
    { name: "セリエA" },
    { name: "代表サッカー" }
  ])

  (1..50).each do |n|
    Board.create(name: "ユーザー#{n}", title: "タイトル#{n}", body: "本文#{n}", category_id: rand(1..6))
  end
end
