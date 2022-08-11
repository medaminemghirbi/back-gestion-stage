class MotifsController < ApplicationController
    #include CurrentUserConcern
    def index
        render json: Motif.all.order(id: :ASC)  
      end
    
      def create
      
        @motif = Motif.new(post_params) 
        if @motif.save
    
          render json: @motif, statut: :created, location: @motif
    
        else
          render json: @motif.errors, statut: :unprocessable_entity
        end
      end
    
      def show
        @motif = Motif.find(params[:id])
        render json: @motif
      end
    
      def update
        @motif = Motif.find(params[:id])
        if @motif.update(post_params2)
          render json: @motif
    
        else
          render json: @motif.errors, statut: :unprocessable_entity
        end
      end
    
      def destroy
        @motif = Motif.find(params[:id])
        @motif.destroy
      end
    
      private
    
      def post_params
        params.permit(:reason )
      end
    
      def post_params2
        # lazm tbaath kol shy fl update
        params.permit(:reason)
      end

    
      def set_post
        @motif = Motif.find(params[:id])
      end
    end