class UsersController < ApplicationController

def display
  @classsessions = Classsession.all




  render("users/my_details.html.erb")
end

end
