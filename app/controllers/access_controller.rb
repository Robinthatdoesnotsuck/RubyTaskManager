class AccessController < ApplicationController
  layout 'application'

  before_action :confirm_logged_in, except: [:new, :create]
  # display menu
  def menu
    # render('menu)
    # render(plain: "just text")
    # render(html: "<strong>HTML text </strong>")
    # render(json: Task.first)
    # render(xml: ['dog', 'cat', 'mouse'])
    # render(plain: 'OK', status: 200)
    # path_to_404 = Rails.root.join('public', '404.html')
    # render(file: path_to_404)
    # send_file(path_to_404)
    # string = render_to_string(file: path_to_404)
    # logger.debug(string)
  end

  # display login form
  def new
    if logged_in?
      redirect_to(menu_path)
    end
  end

  # processs login form
  def create
    logger.info("*** Login User #{params[:username]}")
    # do login process here
    # Cookies is a container for many cookies
    cookies[:username] = params[:username]
    session[:user_id] = 1483
    flash[:notice] = "Log in succesful"

    redirect_to(menu_path)
  end

  # logout user
  def destroy
    logger.info("*** Logout User #{cookies[:username]}")
    # do logout process here
    cookies[:username] = nil
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to(login_path)
  end

end
