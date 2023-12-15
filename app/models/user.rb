class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:user, :admin]
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  after_initialize :set_default_role, if: :new_record?
  has_many :bookings, dependent: :destroy
  def set_default_role
    self.role ||= :user
  end

end
