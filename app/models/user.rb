class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :vip, :admin]
  after_initialize :default_role, if: :new_record?

  has_many :posts

  def default_role
    self.role ||= :user
  end
end
