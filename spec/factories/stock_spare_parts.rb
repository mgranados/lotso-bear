
status = ['Instalada','En Transito','Lista Para Instalarse','Disponible']
colors = ['Rojo', 'Blanco', 'Negro', 'Azul', 'Grey-Neutro', 'RGB', 'Amarillo']

FactoryGirl.define do
  factory :stock_spare_part do |f|
    f.status {status[rand(status.length)]}
    f.idWarehouse 1
    f.idWorkshopCar 1
    f.color {colors[rand(colors.length)]}
    f.idSparePart 1
  end
end
