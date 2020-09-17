class ApplicationController < ActionController::Base

    helper_method :current_user


    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login_user!
        # user ||= @user
        if @user
            session[:session_token] = @user.reset_session_token!
            redirect_to cats_url
        else
            flash.now[:errors] = ["Invalid Credentials"]
            render :new, status: 422
        end
    end

    def if_logged_in
        redirect_to cats_url if !!current_user
    end

    def is_owner?
       current_user_cats = User.joins(:cats).where("users.id = ?", current_user.id).pluck("cats.id")
       redirect_to cat_url(params[:id]) unless current_user_cats.include?(params[:id].to_i) 
    end

    def rental_owner?
        request = CatRentalRequest.find(params[:id])
        cat = Cat.find(request.cat_id)
        cat_owner = cat.user_id
        redirect_to cat_url(cat) unless cat_owner == current_user.id
    end
end
