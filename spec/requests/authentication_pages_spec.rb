require 'spec_helper'

describe "Authentication" do

  subject {page}

  describe "signin page" do
    before {visit signin_path}

    #debe tener la página
    it {should have_content('Login')}
    # it {should have_title('Login')}

  end

  describe "signin process" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      # it { should have_title('Sign in') }
      it { should have_selector('div.alert.alert-error') }

      describe "after visiting another page" do
        before { click_link "SYRAT" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_content("Home") }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
    end
  end

  describe "authorization" do

    describe "for non-signed-in users" do

      describe "in the Workshop controller" do

        describe "visiting admin page" do
          #index admin
          before { visit '/a' }
          it { should have_content('Login') }
        end

      end
    end

    describe "for wrong-privileged users" do
      #checkin con otro user non admin
      let(:non_admin) { FactoryGirl.create(:user) }

      before { sign_in non_admin }

      describe "in the Workshop controller" do

        describe "visiting admin page" do
          #index admin
          it { should have_content('Bienvenido') }
        end

      end
    end

    describe "for correct privileged users" do
      let(:right_privileges_user) {FactoryGirl.create(:user)}
      before { sign_in right_privileges_user }

      describe "in the First Page" do

          #index admin
          it { should have_content("#{right_privileges_user.privileges}") }

      end
    end


    # describe "as wrong user" do
    #   let(:user) { FactoryGirl.create(:user) }
    #   let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
    #   before { sign_in user, no_capybara: true }
    #
    #   describe "submitting a GET request to the Users#edit action" do
    #     before { get edit_user_path(wrong_user) }
    #     specify { expect(response.body).not_to match(full_title('Edit user')) }
    #     specify { expect(response).to redirect_to(root_url) }
    #   end
    #
    #   describe "submitting a PATCH request to the Users#update action" do
    #     before { patch user_path(wrong_user) }
    #     specify { expect(response).to redirect_to(root_url) }
    #   end
    # end
  end

end#final
