class Usuario < ApplicationRecord
  #after_create :assign_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
  #def assign_default_role
  #      self.add_role(:cliente) if self.roles.blank?
  #end
  has_many :turnos
  belongs_to :sucursal, class_name: "Sucursal", optional:true




end
