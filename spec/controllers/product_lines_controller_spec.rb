require 'rails_helper'

describe ProductLinesController do
    context 'import' do
        context "successfully importing files" do
            before do
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
                post :import, params: {:file => "Totally_not_a_real_file.pdf" }
            end
            
            it 'should indicate failure' do
                expect(flash[:danger]).to eq "Error Uploading File."
            end
            
            it 'should redirect accordingly' do
               response.should redirect_to 'https://google.com/' 
            end
        end
    end
    
    context 'destroy' do
        it '' do
            
        end
    end
end