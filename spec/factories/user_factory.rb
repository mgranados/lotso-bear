FactoryGirl.define do
  factory :user do
    name "Jorge Campos"
    email "ajustador@ajustador.com"
    username "ajustador@ajustador.com"
    password "foobar"
    password_confirmation "foobar"
    privileges "capturista"
    
    factory :admin do
      privileges "admin"
    end

    factory :adjuster do
      privileges "ajustador"
    end

  end
end
