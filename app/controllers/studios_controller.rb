class StudiosController < ApplicationController
  def index
    @studios = Studio.all

    render("studios/index.html.erb")
  end

  def show
    @studio = Studio.find(params[:id])

    street_address = @studio.location
  input = street_address.gsub(" ","+")
  mapurl = "https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyB_nAWVr-18Oi_XoadzVHmNT2vevvJfev4&address="+input
  map_parsed_data = JSON.parse(open(mapurl).read)
  @latitude = map_parsed_data["results"][0]["geometry"]["location"]["lat"]
  @longitude = map_parsed_data["results"][0]["geometry"]["location"]["lng"]

    render("studios/show.html.erb")
  end

  def new
    @studio = Studio.new

    render("studios/new.html.erb")
  end

  def create
    @studio = Studio.new

    @studio.name = params[:name]
    @studio.location = params[:location]

    save_status = @studio.save

    if save_status == true
      redirect_to("/studios/#{@studio.id}", :notice => "Studio created successfully.")
    else
      render("studios/new.html.erb")
    end
  end

  def edit
    @studio = Studio.find(params[:id])

    render("studios/edit.html.erb")
  end

  def update
    @studio = Studio.find(params[:id])

    @studio.name = params[:name]
    @studio.location = params[:location]

    save_status = @studio.save

    if save_status == true
      redirect_to("/studios/#{@studio.id}", :notice => "Studio updated successfully.")
    else
      render("studios/edit.html.erb")
    end
  end

  def destroy
    @studio = Studio.find(params[:id])

    @studio.destroy

    if URI(request.referer).path == "/studios/#{@studio.id}"
      redirect_to("/", :notice => "Studio deleted.")
    else
      redirect_to(:back, :notice => "Studio deleted.")
    end
  end
end
