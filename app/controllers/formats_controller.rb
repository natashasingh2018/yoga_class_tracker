class FormatsController < ApplicationController
  def index
    @formats = Format.all

    render("formats/index.html.erb")
  end

  def show
    @format = Format.find(params[:id])

    render("formats/show.html.erb")
  end

  def new
    @format = Format.new

    render("formats/new.html.erb")
  end

  def create
    @format = Format.new

    @format.title = params[:title]
    @format.description = params[:description]

    save_status = @format.save

    if save_status == true
      redirect_to("/formats/#{@format.id}", :notice => "Format created successfully.")
    else
      render("formats/new.html.erb")
    end
  end

  def edit
    @format = Format.find(params[:id])

    render("formats/edit.html.erb")
  end

  def update
    @format = Format.find(params[:id])

    @format.title = params[:title]
    @format.description = params[:description]

    save_status = @format.save

    if save_status == true
      redirect_to("/formats/#{@format.id}", :notice => "Format updated successfully.")
    else
      render("formats/edit.html.erb")
    end
  end

  def destroy
    @format = Format.find(params[:id])

    @format.destroy

    if URI(request.referer).path == "/formats/#{@format.id}"
      redirect_to("/", :notice => "Format deleted.")
    else
      redirect_to(:back, :notice => "Format deleted.")
    end
  end
end
