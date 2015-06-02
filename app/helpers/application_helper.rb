# -*- encoding : utf-8 -*-
module ApplicationHelper
#Metodo para el titulo
  def full_title(page_title)
    base_title = "SYRAT"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  PRIVS = %w(admin gerente ajustador operador capturista proceso almacen)

end
