require_relative "../spec_helper"

RSpec.describe 'Login Page' do
    describe 'get/login' do 
        it 'is shown as the default page' do
            visit '/'
            expect (page).to have_content 'Login'
        end

        it 'takes the viewer to their page' do
            create_account("Dominic", "domdom@gmail.com", "lsu", "Everton")
            login("Dominic", "Everton", "type")
            expect (page).to have_content 'Welcome'

        end

        it 'cannot go back to login page without logging out' do
            create_account("Dominic", "domdom@gmail.com", "lsu", "Everton")
            login("Dominic", "Everton", "type")
            visit '/login'
            expect (page).to have_content 'Welcome'
        end

        it 'shows an error when typing the wrong password' do
            create_account("Dominic", "domdom@gmail.com", "lsu", "Everton")
            login("Dominic", "Everton1", "type")
            expect (page).to have_content "Username/Password combination incorrect"
        end

        it 'shows an error if password is empty' do
            create_account("Dominic", "domdom@gmail.com", "lsu", "Everton")
            login("Dominic", "", "type")
            expect (page).to have_content "Password cannot be empty"
        end

        it 'shows an error when logging in without a username' do
            create_account("Dominic", "domdom@gmail.com", "lsu", "Everton")
            login("", "Everton1", "type")
            expect (page).to have_content "Username cannot be empty"
        end

        it 'shows an error when credentials are not typed' do
            create_account("Dominic", "domdom@gmail.com", "lsu", "Everton")
            login("", "", "type")
            expect (page).to have_content "Username cannot be empty"
        end
   end
end