module ApplicationHelper
  def em_reais(valor)
    number_to_currency(valor, :unit => 'R$', :format => '%u %n', :separator => ',', :delimiter => '.')
  end
  
  def vimeo(video)
    html = <<-html
      <iframe src="#{video}" width="500" height="281" frameborder="0" 
        webkitallowfullscreen mozallowfullscreen allowfullscreen>
      </iframe>
    html
    html.html_safe
  end
  
  def youtube(video)
    html = <<-html
      <iframe width="420" height="315" src="#{video}" frameborder="0" allowfullscreen></iframe>
    html
    .html_safe
  end
end
