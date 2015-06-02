# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "UserPages" do

  subject { page }

  describe "new user page" do
    before { visit new_user_path }

    it { should have_content('Ingresa los datos del usuario') }
    it { should have_content('Dar de alta usuario') }
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    # checar title
    #it { should have_title(user.name) }
  end

  describe "signup a user" do

    before { visit new_user_path }

    let(:submit) { "Dar de Alta Usuario" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_content('error') }
      end

    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Username",     with: "exampleuser"
        select "admin",         :from =>'Privileges'
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        # it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'éxito') }
      end
    end
  end

end
