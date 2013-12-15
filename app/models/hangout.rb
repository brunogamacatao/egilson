class Hangout < ActiveRecord::Base
  belongs_to :curso
  attr_accessible :descricao, :nome, :url, :curso, :curso_id, :video
end
