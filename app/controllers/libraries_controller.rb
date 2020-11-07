class LibrariesController < ApplicationController
  def new
    @library = Library.new
  end

  def edit
  end

  def destroy
  end

  def index
    @libraries = Library.all
  end
end
