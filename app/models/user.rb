class User < ApplicationRecord
  enum role: [:user, :admin]
  after_initialize :set_defaul_role, :if => :new_record?

  def set_defaul_role
    self.role ||= :user
  end

  def self.search(search)
    if search != "" && search
      User.where(email: search)
    else
      User.all
    end
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
