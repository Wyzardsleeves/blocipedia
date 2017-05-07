class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #before_action :authenticate_user!

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis

  validates :role, inclusion: {in: %w(standard premium admin)}

  def standard?
    self.role == 'standard'
  end

  def admin?
    self.role == 'admin'
  end

  def premium?
    self.role == 'premium'
  end

  def toPremium
    self.role = 'premium'
    self.save!
  end

  def toStandard
    self.role = 'standard'
    self.save!
  end

end


# User.where(role: "0").update_all(role: "standard")
