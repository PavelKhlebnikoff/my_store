class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  private

    def render_403
      render file: "public/403.html", status: 403
    end

    def render_404
      render file: "public/404.html", status: 404
    end

    def check_if_admin
      render_403 unless params[:admin]
      #render plain: "acces denied", status: 403  unless params[:admin] #curent_user.admin == true
    end

end
