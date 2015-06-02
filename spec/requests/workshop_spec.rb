# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Bienvenida a Workshop" do
  subject {page}
  let(:adjuster){FactoryGirl.create(:adjuster)}

  describe "Index" do
    before do
      visit root_path
    end
    it {  should have_title ('SYRAT | Inicio de Sesión') }
    it {  should have_button ('Ingresar')}
    it {  should have_field("Email")}
    it {  should have_field("Password")}
  end

  describe "Ajustador" do

    before do
      sign_in adjuster
    end
      #aviso de privacidad
    describe "Aceptando términos" do
      it  { should have_title ('SYRAT | Aviso de Privacidad') }
      it  { should have_button ('Aceptar Términos')}
      #y me lleva a nuevo siniestro
    end
  end

end
