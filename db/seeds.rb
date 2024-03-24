User.find_or_create_by!(email: 'test@example.com') do |user|
  user.name = "デモユーザー"
  user.password = 'password'
  user.password_confirmation = 'password'
end