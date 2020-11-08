class ClientsController < ApplicationController
  def new
    @client = Client.new
    # @library = Library.find(params[:id])
    # @library = Library.find(params[:library])
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      # library = Library.find(params[:library_id])
      redirect_to libraries_path
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
  end

  def edit
  end

  private def client_params
    params.require(:client).permit(:first_name, :second_name, :library_id)
  end
end
