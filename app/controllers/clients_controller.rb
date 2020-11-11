# frozen_string_literal: true

class ClientsController < ApplicationController
  def new
    @client = Client.new
    @library = Library.find(params[:library_id])
  end

  def create
    @client = Client.new(client_params)
    @library = Library.find(params[:library_id])
    if @client.save
      redirect_to library_path(@library)
    else
      render 'new'
    end
  end

  def edit
    @library = Library.find(params[:library_id])
    @client = @library.clients.find(params[:id])
  end

  def update
    @library = Library.find(params[:library_id])
    @client = @library.clients.find(params[:id])

    if @client.update(client_params)
      flash[:notice] = 'Client Updated'
      redirect_to library_path(@library)
    else
      render 'new'
    end
  end

  def destroy
    @library = Library.find(params[:library_id])
    @client = @library.clients.find(params[:id])
    @client.destroy

    flash[:notice] = 'Client Removed'
    @library = Library.find(params[:library_id])
    redirect_to library_path(@library)
  end

  def show
    @library = Library.find(params[:library_id])
    @client = @library.clients.find(params[:id])
  end

  private def client_params
    params.require(:client).permit(:first_name, :second_name, :library_id)
  end
end
