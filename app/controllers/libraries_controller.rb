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
    @library = Library.find(params[:id])
  end

  def update
    @library = Library.find(params[:id])
    if @library.update(library_params)
      flash[:notice] = 'Library Updated'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @library = Library.find(params[:id])
    @library.destroy

    flash[:notice] = 'Library Removed'
    redirect_to libraries_path
  end

  def index
    # @libraries = Library.all
    @libraries = Library.order(params[:sort])
  end

  def show
    @library = Library.find(params[:id])
    @clients = @library.clients

  end

  private def library_params
    params.require(:library).permit(:name, :address, :description)
  end
end