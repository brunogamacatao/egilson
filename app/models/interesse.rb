class Interesse < ActiveRecord::Base
  belongs_to :curso
  belongs_to :user
  
  attr_accessible :curso, :user, :curso_id, :user_id
end
