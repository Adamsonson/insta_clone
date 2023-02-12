class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_one_attached :avatar
  has_many :likes

  followability

  before_create :randomize_id

  enum role: [:user, :admin]

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :admin
  end

  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end

  def self.ransackable_attributes(auth_object = nil)
    ['email', 'bio', 'user_name']
  end
  private

  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000_000)
    end while User.where(id: self.id).exists?
  end
end
