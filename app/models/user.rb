class User < ApplicationRecord

  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates :username,presence:true ,uniqueness: {case_insensitive:false}, format: {with: /\A[a-zA-Z0-9 _\.]*\z/}
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable


  def self.find_first_by_auth_conditions(warden_conditions)
    conditions= warden_conditions.dup
    if login =conditions.delete(:login)
      where(conditions.to_hash).where("lower(username)= :value OR lower(email) = :value", value: login.downcase).first
    else
      where(conditions.to_hash)
    end 
  end
end
