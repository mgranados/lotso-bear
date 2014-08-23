FactoryGirl.define do
  factory :user do
    name     "Kevin Mendez"
    email    "kev@kev.com"
    username "kevinmen"
    password "foobar"
    password_confirmation "foobar"
    privileges "capturista"
    factory :admin do
      privileges "admin"
    end
    factory :manager do
      privileges "gerente"
    end
    factory :operator do
      privileges "operador"
    end
    factory :adjuster do
      privileges "ajustador"
    end
end


end
