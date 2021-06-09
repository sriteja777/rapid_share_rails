class DocumentsController < ApplicationController
    skip_before_action :authorized, only: [:shared, :show]

    def new
        @document = Document.new
    end

    def show
        @document = Document.find_by(id: params[:id], shared: true)
    end

    def create
        @user = User.find(session[:user_id])
        @document = @user.documents.create()
        @document.document.attach(params[:document])
        file_name = @document.document.filename.to_s
        file_size = @document.document.blob.byte_size
        @document.update(name: file_name, shared: false)
        redirect_to "/dashboard"
        # puts "nameeee           #{@document.document.blob.byte_size}"
        # @user.documents.attach(params[:document])
    end

    def destroy
        @user = User.find(session[:user_id])
        @document = @user.documents.find(params[:id])
        @document.destroy
        redirect_to '/dashboard'
    end

    def share
        @user = User.find(session[:user_id])
        share = params[:set].to_s == "true"
        @document = @user.documents.find(params[:id])
        @document.update(shared: share)
        redirect_to "/dashboard"
    end

    def shared
        @shared_documents = Document.where("shared" => true).order('created_at desc')
    end

    private
    def document_params
      params.require(:document).permit(:document)
    end
end
