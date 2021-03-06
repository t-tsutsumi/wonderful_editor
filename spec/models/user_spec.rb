# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  allow_password_change  :boolean          default(FALSE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  image                  :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  name                   :string
#  provider               :string           default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  tokens                 :json
#  uid                    :string           default(""), not null
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#

# RSpec.describe User, type: :model do
#   context "name を指定しているとき" do
#     it "ユーザーが作られる" do

#       user = build(:user)
#       expect(user).to be_valid
#     end
#   end

#   context "name を指定していないとき" do
#     it "ユーザー作成に失敗する" do
#       user = build(:user, name: nil)
#       expect(user).to be_invalid
#       expect(user.errors.details[:name][0][:error]).to eq :blank

#     end
#   end

#   # context "まだ同じ名前の name が存在しないとき" do
#   #   it "ユーザーが作られる" do
#   #   end
#   # end

#   context "すでに同じ名前の name が存在しているとき" do
#     it "ユーザー作成に失敗する" do
#     # User.create!(name: "foo", email: "foo@example.com", password: "aaaaaaaaaaa")
#     # user = User.new(name: "foo", email: "bar@example.com", password: "bbbbbbbbbbbb")

#     # expect(user.valid?).to eq true
#     end
#   end
# end

require "rails_helper"

RSpec.describe User, type: :model do
  context "必要な情報が揃っている場合" do
    let(:user) { build(:user) }

    it "ユーザー登録できる" do
      expect(user).to be_valid
    end
  end

  context "名前のみ入力している場合" do
    let(:user) { build(:user, email: nil, password: nil) }

    it "エラーが発生する" do
      expect(user).not_to be_valid
    end
  end

  context "email がない場合" do
    let(:user) { build(:user, email: nil) }

    it "エラーが発生する" do
      expect(user).not_to be_valid
    end
  end

  context "password がない場合" do
    let(:user) { build(:user, password: nil) }

    it "エラーが発生する" do
      expect(user).not_to be_valid
    end
  end
end
