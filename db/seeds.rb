# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!(
  [
    {email: 'eiki@example.com', name: 'Eiki', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'hiroto@example.com', name: 'Hiroto', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'kouta@example.com', name: 'Kouta', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")}
  ]
)

Book.create!(
  [
    {title: 'ONE PIECE', body: 'ジャンプの漫画', user_id: users[0].id },
    {title: 'ブルーロック', body: 'マガジンの漫画', user_id: users[1].id },
    {title: '名探偵コナン', body: 'サンデーの漫画',  user_id: users[2].id }
  ]
)
