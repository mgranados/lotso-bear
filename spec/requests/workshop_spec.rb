require 'spec_helper'

describe "Bienvenida a Workshop" do
  subject {page}

  describe "Index" do
    before do
      visit root_path
    end
    it { should have_title ('SYRAT | Inicio de Sesión') }
    it { should have_button ('Ingresar')}
    it {should have_field("Email")}
    it {should have_field("Password")}
  end

end
