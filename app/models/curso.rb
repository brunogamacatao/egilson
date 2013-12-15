class Curso < ActiveRecord::Base
  extend FriendlyId
  
  # Atributos transientes
  attr_accessor :mensagem
  
  # Atributos especiais
  friendly_id :nome, use: :slugged
  mount_uploader :imagem, ImagemUploader
  
  attr_accessible :descricao, :imagem, :inicio_previsto, :nome, :proxima_turma
  attr_accessible :preco, :ementa, :tem_promocao, :preco_promocional, :aviso
  
  # Relacionamentos
  has_many :matriculas
  has_many :materiais
  has_many :aulas
  has_many :hangouts
  
  # Geração dos slugs
  def slug_candidates
    [
      :nome,
      [:nome, :id]
    ]
  end
  
  def matriculado?(user)
    matriculas.where("user_id = ? AND estado_cd = ?", user.id, Matricula.estados(:confirmada)).exists?
  end
  
  def to_s
    nome
  end
  
  scope :abertos,  -> { where(inicio_previsto: true).order("proxima_turma, id") }
  scope :proximos, -> { where(inicio_previsto: false).order("created_at") }
end
