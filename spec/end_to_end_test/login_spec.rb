require_relative "../spec_helper"

RSpec.describe 'Login Page' do
    describe 'get/login' do 
        it 'is shown as the default page' do
            visit '/'
            expect (page).to have_content 'Login'
        end

        it 'takes the viewer to their page' do
            login("Dominic", "Everton", "type")
            expect (page).to have_content 'Welcome'

        end

        it 'cannot go back to login page without logging out' do
        end

        it 'shows an error when typing the wrong password' do
        end

        it 'shows an error if password is empty' do
        end

        it 'shows an error when logging in without a username' do
        end

        it 'shows an error when credentials are not typed' do
        end
   end
end