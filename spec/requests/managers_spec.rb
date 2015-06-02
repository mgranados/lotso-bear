# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Managers" do
  subject {page}

  describe "Index" do
    let(:manager){FactoryGirl.create(:manager)}

    before do
      sign_in manager
    end
    it { should have_title ('SYRAT | Gerente') }
    it { should have_link('Reportes') }
    it { should have_link('Nóminas') }
  end

end
