class DemandesController < ApplicationController
    #include CurrentUserConcern
    def index
        render json: Demande.all.order(id: :ASC)  
      end
    
      def create
      
        @demande = Demande.new(post_params) 
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
        if @demande.update(post_params2)
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
        params.permit(:start_date, :end_date, :motif_id, :status, :user_id )
      end

    
      def set_post
        @demande = Demande.find(params[:id])
      end
    end