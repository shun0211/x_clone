class SessionsController < Devise::SessionsController
  def guest_sign_in
    guest = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in guest
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました。"
  end
end