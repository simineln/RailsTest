class LibrariesController < ApplicationController
  def new
    @page_title = "Add Library"
    @library = Library.new
  end

  def create
    @library = Library.new(library_params)
    if @library.save
      redirect_to libraries_path
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
  end

  def index
    @libraries = Library.all
  end

  def show
    @library = Library.find(params[:id])
    @clients = @library.clients

  end

  private def library_params
    params.require(:library).permit(:name, :address, :description)
  end
end