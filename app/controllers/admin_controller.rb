class AdminController < ApplicationController
    include CurrentUserConcern

    def getallemployees
        @users = User.all.select { |m| m.role == 'employee' }
        render json: @users, methods: [:user_image_url]
    end
    def countall
      @userscount = User.all.count
      @requestcount = Demande.all.count
      @accepteddemandes = Demande.where('status = ?', status = 2).count
      @refuseddemandes = Demande.where('status = ?', status = 1).count
      render json: {
        data: [@userscount, @requestcount,@accepteddemandes , @refuseddemandes]
  
      }
    end




    def deleteemployee
        @user = User.find(params[:user_id])
        @user.destroy
    end

    def updateimageadmin
        @user = User.find(params[:id])
    
        if @user.update(paramsimagefreelancer)
          render json: @user, methods: [:user_image_url]
    
        else
          render json: @user.errors, statut: :unprocessable_entity
        end
      end
    
      def paramsimagefreelancer
        
        params.permit(:id, :avatar)
    end

    def updateadmin
        @user = User.find(params[:id])
        
        if @user.update(post_parasmadmin)
    
          render json: @user, methods: [:user_image_url]
    
        else
          render json: @user.errors, statut: :unprocessable_entity
        end
    end

    def updateemployeebyadmin
      @user = User.find(params[:id])
   
      if @user.update(post_paramsadminemployee)
        render json: @user, methods: [:user_image_url]
  
      else
        render json: @user.errors, statut: :unprocessable_entity
      end
    end

    private
    def post_paramsadminemployee
      params.permit(:id, :email, :password, :adress, :lastname, :firstname, :avatar)
  end
    def post_parasmadmin
        params.permit(:id, :email, :password, :adress, :lastname, :firstname, :avatar)
    end
end