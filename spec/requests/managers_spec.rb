require 'spec_helper'

describe "Gerente" do
  subject {page}

  describe "Index" do
    before do
      visit '/a'
    end
    it { should have_title ('Gerente') }
    it { should have_button('Reportes') }
    it { should have_button('Facturas') }
    it { should have_button('Nóminas') }
  end

end
