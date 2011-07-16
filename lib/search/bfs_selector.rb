require 'selector'
# Seleciona o vértice para a busca em largura
class BfsSelector < Selector
 
  # choose the first element from set
  def choose_from_set(l)
    l.first
  end
 
end


