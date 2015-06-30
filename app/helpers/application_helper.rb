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
  
  PRIVS = %w(admin gerente ajustador operador capturista proceso almacen empleado)


  def generate_labels_pdf(labels)
		Prawn::Document.generate("app/assets/pdf/barcodes.pdf", top_margin: 2.15.send(:cm), right_margin: 0.79.send(:cm), bottom_margin: 1.7.send(:cm), left_margin:  0.62.send(:cm) )do
			y_axis = 680
			number_labels = 0
			labels.each do |label|
			if number_labels%2 == 0
				bounding_box([20,y_axis], :width => 240, :height => 95) do
					image label[:png], :at => [35, 80]
					move_down 10
					text "#{label[:model]}  #{label[:name]}",:align => :center
					move_down 50
					text "#{label[:code]}-#{label[:entrance_date]}",:align => :center
				end
			else
				bounding_box([315,y_axis], :width => 240, :height => 95) do
					image label[:png], :at => [35, 80]
					move_down 10
					text "#{label[:model]}  #{label[:name]}",:align => :center
					move_down 50
					text "#{label[:code]}-#{label[:entrance_date]}",:align => :center
				end
			end
			if number_labels == 13
				number_labels = 0
				y_axis=680
				start_new_page
			else
				if number_labels%2 != 0
					y_axis-=95
				end
				number_labels+=1
			end
		end
	end

	
	end
end
