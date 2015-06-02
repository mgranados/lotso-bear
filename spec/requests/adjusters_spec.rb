# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Ajustador" do
  subject {page}

  describe "Index" do
    let(:adjuster){FactoryGirl.create(:adjuster)}

    before do
      sign_in adjuster
    end

    it "Tiene Titulo" do should have_title ('SYRAT | Ajustador') end
    it "Muestra Mensaje de Privacidad" do should have_content ('Aviso de Privacidad') end
  end


  describe "Acepta Aviso de privacidad" do
    before do
      click_button "Acepto el Aviso de Privacidad"
    end

    # => Prevaluation
    it "Tiene H1 Nuevo Siniestro" do should have_content ('Nuevo Siniestro') end
    it "Tiene field Numero Siniestro" do should have_field('preValuationNumber') end
    it "Tiene field Numero de Poliza" do should have_field('preValuationNumber') end
    it "Tiene field Inidice" do should have_field('preValuationSubsection') end
    it "Tiene field Fecha de Expedición" do should have_field('preValuationExpeditionDate') end
    it "Tiene field Fecha de Siniestro" do should have_field('preValuationDate') end
    it "Tiene field Valor Deducible" do should have_field('preValuationDeductibleValue') end
    it "Tiene field Valor Comercial" do should have_field('preValuationCommercialValue') end
    it "Tiene field Requiere Grua" do should have_field('preValuationRequiresCrane') end
    it "Tiene field Estatus Cobranza" do should have_field('preValuationCollectionStatus') end
    it "Tiene field Condiciones Especiales" do should have_field('preValuationSpecialConditions') end
    it "Tiene field Tercero Asegurado" do should have_field('preValuationThirdInsured') end
    it "Tiene field Nombre del Ajustador" do should have_field('preValuationAgentName') end
    it "Tiene field Comentario" do should have_field('preValuationComment') end
    it "Tiene field Modelo coche" do should have_field('preValuationCar') end
    # => Car
    it "Tiene field Color del coche" do should have_field('carColor') end
    it "Tiene field Numero de Puertas" do should have_field('carDorNumber') end
    it "Tiene field Placas" do should have_field('carLicensePlates') end
    it "Tiene field Número de Taxi" do should have_field('carTaxiNumber') end
    # => Insured
    it "Tiene field nombre del asegurado" do should have_field('insuredName') end
    it "Tiene field telefono del asegurado" do should have_field('insuredTelephone') end
    it "Tiene field insuredMail" do should have_field('insuredEmail') end

  end
end
