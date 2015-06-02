# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Operador" do
  subject {page}

  describe "Index" do
    let(:operator){FactoryGirl.create(:operator)}

    before do
      sign_in operator
    end

    it { should have_title ('SYRAT | Operador') }
    it { should have_link('Nueva', href: new_valuation_path) }
    it { should have_link('Editar') }
    it { should have_link('Inventario', href:'/inventory') }
    it { should have_link('Pedidos', href:'/orders') }
    it { should have_link('Envios', href:'/dispatchs') }

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
