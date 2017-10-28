require 'rails_helper'
require 'chows_helper'


describe ChowsController do
    context 'import' do
        context "successfully importing files" do
            before do
                test_csv = Rails.root.join('spec', 'fixtures', 'files', 'fork_friendly_upcs.csv')
                file = Rack::Test::UploadedFile.new(test_csv, "text/csv")
                puts test_csv
                puts file
                post :import, { :file => file }
            end
            
            it 'should indicate success' do
                expect(flash[:success]).to eq "File Imported"
            end
            
            it 'should redirect to the appropriate page' do
                response.should redirect_to chows_index_path
            end
        end
        
        context 'unsuccsessfully importing files' do
            before do
                post :import, { :file => "Totally_not_a_real_file.pdf" }
            end
            
            it 'should indicate failure' do
                expect(flash[:danger]).to eq "Error Uploading File."
            end
            
            it 'should redirect accordingly' do
               response.should redirect_to chows_new_path 
            end
        end
    end
    
    context 'destroy' do
        it '' do
            
        end
    end
end