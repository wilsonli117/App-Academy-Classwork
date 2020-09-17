require "rails_helper"


    feature "Feature test: show users index", type: :feature do
        before :each do
            visit(users_url)
        end

        scenario "index" do
            expect(page).to have_content("These Are Our Users!")
        end
    end
