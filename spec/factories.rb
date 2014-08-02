FactoryGirl.define do
  factory :user do
    name     "Kevin Mendez"
    email    "kev@kev.com"
    username "kevinmen"
    password "foobar"
    password_confirmation "foobar"
    privileges "capturista"
  end
  factory :admin do
      privileges "admin"
  end

end
