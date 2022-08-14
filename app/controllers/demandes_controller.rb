class DemandesController < ApplicationController
    #include CurrentUserConcern
    def index
        render json: Demande.all.order(id: :ASC), include: [  :user, :motif   ]  
    end
    
      def create
      
        @demande = Demande.new(post_params) 
        days= ((@demande.end_date.to_date - @demande.start_date.to_date).to_i)+1
        
        @demande.update_attribute(:days,days)
        if @demande.save
    
          render json: @demande, statut: :created, location: @demande , include: [  :user, :motif  ]
    
        else
          render json: @demande.errors, statut: :unprocessable_entity
        end
      end
    
      def show
        @demande = Demande.find(params[:id])
        render json: @demande, include: [  :user, :motif   ]
      end
    
      def update
        @demande = Demande.find(params[:id])
        byebug
        if post_params2[:status] =="encours" || post_params2[:status] =="refused" 
          @demande.update(post_params2)
          render json: @demande, include: [:user, :motif]
        elsif post_params2[:status] =="accepted"
          demande_days = (@demande.days).to_f
          @user = User.where("id = ?" ,  @demande.user_id )   
          balance_days = @user.pluck(:nbr_days).join(',').to_f       
          result = (balance_days-demande_days).to_f    
          @demande.update(post_params2) 
          @user.update_all(:nbr_days => result)
         
          render json: @demande, include: [  :user, :motif   ]
        else
          render json: @demande.errors, statut: :unprocessable_entity
        end
      end
    
      def destroy
        @demande = Demande.find(params[:id])
        @demande.destroy
      end
    

      def getdemandebyemployee  
        @demande = Demande.where(user_id: params[:user_id])
        render json: @demande , include: [  :user, :motif   ]
    end
      private
    
      def post_params
        params.permit(:start_date, :end_date, :motif_id, :status, :user_id )
      end
    
      def post_params2
        # lazm tbaath kol shy fl update
        params.permit(:start_date, :end_date, :refus_reason, :motif_id, :status, :user_id )
      end

    
      def set_post
        @demande = Demande.find(params[:id])
      end
    end