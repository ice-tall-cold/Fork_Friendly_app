require 'rails_helper'

describe ProductLinesController do
    context 'import' do
        context "successfully importing files" do
            before do
                User.destroy_all
                load "#{Rails.root}/db/seeds.rb"
                session[:user_id] = 1
                test_csv = Rails.root.join('spec', 'Saladtoyogurt.xlsx')
                file = Rack::Test::UploadedFile.new(test_csv, "text/xlsx")
                puts test_csv
                puts file
                post :import, params: {:file => file }
            end
            
            #it 'should indicate success' do
                #expect(flash[:success]).to eq "File Imported"
           # end
            
            it 'should redirect to the appropriate page' do
                response.should redirect_to health_concerns_new_path
            end
        end
        
        context 'unsuccsessfully importing files' do
            before do
                User.destroy_all
                load "#{Rails.root}/db/seeds.rb"
                session[:user_id] = 1
                test_csv = Rails.root.join('spec', 'Iteration_0.docx')
                file = Rack::Test::UploadedFile.new(test_csv, "text/xlsx")
                puts test_csv
                puts file
                post :import, params: {:file => file }
            end
            
            it 'should indicate failure' do
                expect(flash[:danger]).to eq "Unknown file type: Iteration_0.docx"
            end
            
            it 'should redirect accordingly' do
               response.should redirect_to 'https://google.com/' 
            end
        end
        
        context 'importing files without login' do
            before do
                User.destroy_all
                load "#{Rails.root}/db/seeds.rb"
                #session[:user_id] = 1
                test_csv = Rails.root.join('spec', 'Saladtoyogurt.xlsx')
                file = Rack::Test::UploadedFile.new(test_csv, "text/xlsx")
                puts test_csv
                puts file
                post :import, params: {:file => file }
            end
            
            it 'should indicate failure' do
                expect(flash[:danger]).to eq "Please log in."
            end
            
            it 'should redirect accordingly' do
               response.should redirect_to login_url
            end
        end
        
        context 'importing files with invalid row' do
            before do
                User.destroy_all
                load "#{Rails.root}/db/seeds.rb"
                session[:user_id] = 1
                test_csv = Rails.root.join('spec', 'Saladtoyogurt_invalidrow.xlsx')
                file = Rack::Test::UploadedFile.new(test_csv, "text/xlsx")
                puts test_csv
                puts file
                post :import, params: {:file => file }
            end
            
            it 'should indicate failure' do
                expect(flash[:danger]).to eq "Error on row 3 of spreadsheet"
            end
            
        end
    end
    
    context 'destroy' do
        it '' do
            
        end
    end
end