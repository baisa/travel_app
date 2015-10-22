class DocumentsController < ApplicationController

  def index
    @trip = Trip.find(params[:trip_id])
    @documents = @trip.documents.all
  end

#  def show
 #   @trip = Trip.find(params[:trip_id])
  #  @document = @trip.documents.find(params[:id])
  #end
 # <%= document[:file] %> -- file name

  def new
    @trip = Trip.find(params[:trip_id])
    @document = Document.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @document = @trip.documents.create(document_params)
    if @document.save
      redirect_to trip_documents_path
    else
      render 'new'
    end
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    @document = @trip.documents.find(params[:id])
    @document.destroy
    redirect_to trip_documents_path(@trip)
  end

  private

  def document_params
    params.require(:document).permit(:title, :file)
  end


end