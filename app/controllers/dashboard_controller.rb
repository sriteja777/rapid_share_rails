class DashboardController < ApplicationController
    def index
        @user = User.find(session[:user_id])
        # @user.documents.reorder("created_at desc")
        begin
            @shared_documents = Document.where("shared" => true).order('created_at desc')
        rescue ActiveRecord::RecordNotFound => e
            @shared_documents = nil
          end
          
    end

end
