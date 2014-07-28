require 'spec_helper'

describe "Bienvenida Clientes" do
  subject {page}

  describe "Index" do
    before do
      visit root_path
    end
    it { should have_title ('SYRAT') }
    it { should have_button ('INGRESAR')}
    it {should have_field("code")}
    it {should have_button("continue")}
  end

end
