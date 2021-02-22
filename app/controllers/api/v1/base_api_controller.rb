class Api::V1::BaseApiController < ApplicationController

  #サインインしているユーザーを取得する
  def current_user
    @current_user ||= User.first
  end

#   def current_api_v1_user
#   end


# # ログイン済ユーザーのみにアクセスを許可する
#   def authenticate_user!

#   end

# # ユーザーがサインイン済かどうかを判定する
#   def user_signed_in?

#   end

end
