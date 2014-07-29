require 'spec_helper'

describe "Operador" do
  subject {page}

  describe "Index" do
    before do
      visit '/a'
    end
    it { should have_title ('Operador') }
    it { should have_link('Reportes', href: reports_path) }
    it { should have_link('Facturas', href:bills_path) }
    it { should have_link('Nóminas', href:paysheets_path) }
  end

  describe "Reportes" do
    before do
      visit reports_path
    end
    it { should have_title ('Reportes') }
  end

  describe "Facturas" do
    before do
      visit bills_path
    end
    it { should have_title ('Facturas') }
  end

  describe "Nóminas" do
    before do
      visit paysheets_path
    end
    it { should have_title ('Nóminas') }
  end

end
