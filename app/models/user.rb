class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  has_one :filtering
  has_many :PreferenceSurveys
  has_many :StartQuerys
  has_many :OtherQuerys

  def self.find_for_oauth(auth, signed_in_resource = nil)
    # user, idnetity가 nil 검사.
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user

    # user가 nil이라면 새로 만듦.
    if user.nil?
      # 이미 존재하는 이메일인지 확인.
      email = auth.info.email
      user = User.where(:email => email).first

      # 이메일이 존재하지 않는다면 새로 만듦.
      unless self.where(email: auth.info.email).exists?
        if user.nil?
          user = User.new(
            email: auth.info.email,
            password: Devise.friendly_token[0, 20]
          )
        end

        # 데이터베이스에 삽입.
        user.save!
      end
    end

    # User와 Identity 연결.
    if identity.user != user
      identity.user = user
      identity.save!
    end

    return user
  end

  # email이 없어도 가입이 되도록 설정
  def email_required?
    false
  end
end
