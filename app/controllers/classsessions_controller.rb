class ClasssessionsController < ApplicationController
  def index
    @classsessions = Classsession.all

    render("classsessions/index.html.erb")
  end

  def show
    @classsession = Classsession.find(params[:id])

    render("classsessions/show.html.erb")
  end

  def new
    @classsession = Classsession.new

    render("classsessions/new.html.erb")
  end

  def create
    @classsession = Classsession.new

    @classsession.happened_at = params[:happened_at]
    @classsession.theme = params[:theme]
    @classsession.length = params[:length]
    @classsession.participants = params[:participants]
    @classsession.comments = params[:comments]
    @classsession.format_id = params[:format_id]
    @classsession.studio_id = params[:studio_id]
    @classsession.user_id = params[:user_id]

    save_status = @classsession.save

    if save_status == true
      redirect_to("/classsessions/#{@classsession.id}", :notice => "Classsession created successfully.")
    else
      render("classsessions/new.html.erb")
    end
  end

  def edit
    @classsession = Classsession.find(params[:id])

    render("classsessions/edit.html.erb")
  end

  def update
    @classsession = Classsession.find(params[:id])

    @classsession.happened_at = params[:happened_at]
    @classsession.theme = params[:theme]
    @classsession.length = params[:length]
    @classsession.participants = params[:participants]
    @classsession.comments = params[:comments]
    @classsession.format_id = params[:format_id]
    @classsession.studio_id = params[:studio_id]
    @classsession.user_id = params[:user_id]

    save_status = @classsession.save

    if save_status == true
      redirect_to("/classsessions/#{@classsession.id}", :notice => "Classsession updated successfully.")
    else
      render("classsessions/edit.html.erb")
    end
  end

  def destroy
    @classsession = Classsession.find(params[:id])

    @classsession.destroy

    if URI(request.referer).path == "/classsessions/#{@classsession.id}"
      redirect_to("/", :notice => "Classsession deleted.")
    else
      redirect_to(:back, :notice => "Classsession deleted.")
    end
  end
end
