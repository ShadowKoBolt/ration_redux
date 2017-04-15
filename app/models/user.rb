class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :plans, dependent: :destroy
  has_many :recipes, -> { order(:name) }, dependent: :destroy
  has_many :foods, -> { order(:name) }, dependent: :destroy

  def initial
    email[0..0].upcase
  end
end
