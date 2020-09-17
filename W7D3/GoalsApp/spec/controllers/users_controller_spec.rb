require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe "GET#index" do
        it "renders the users index page" do
            get :index #symbol points to the action, not the template
            expect(response).to render_template(:index) #this symbole points to template
            expect(response).to have_http_status(200) #this refers to http response
        end
    end

    describe "GET#new" do
        it "renders the sign up form" do
           get :new
           expect(response).to render_template(:new) #this symbole points to template
           expect(response).to have_http_status(200)
        end

    end

    describe "POST#create" do 
        context "with valid params"
            #user will be saved to db "expect(@user.save).to be(true)" 
            #pull last user from db  "expect(@user).to eq(User.last)"
            #redirects to index, change this to show page once it's been built
            #"expect(response).to redirect_to(:index)" 
            post :create, user: {username: "Wilson", password: "Beccarox"}
            expect(response).to redirect_to(:index)
                                            #user_url(User.find_by(username: "Wilson")) <-if we had a show page
            expect(response).to have_http_status(302)
        end

        context "with invalid params"   
            post :create, user: {username: "Wilson"}
            expect(response).to render(:new)
            expect(response).to have_http_status(200)
            #will error 
        end
    end
end
