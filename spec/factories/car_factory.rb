FactoryGirl.define do
  factory :car do
    idGenericCar 1
    carColor "blanco 253"
    carDoorNumber 3
    carSerie "i3"
    carMotor "ids-2341s"
    carLicensePlates "TWR-31X"
    carInventoryDescription "No tenia faros antes del choque"
    carSpecialEquipment "Ninguno"
    factory :taxi do
      carTaxiNumber "22-21RS-3"
    end
  end
end
