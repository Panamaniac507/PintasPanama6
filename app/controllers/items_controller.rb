class ItemsController < ApplicationController
    before_action :set_item, only: [:show, :edit, :update, :destroy]

    def index
      @items = Item.all
    end

    def show
    end

    def new
      @item = Item.new
      @current_user = current_user
    end

    def edit
    end

    def create
      @item = Item.new(item_params)

      respond_to do |format|
        if @item.save
          redirect_to items_path(@user), notice: 'Item was successfully created.'
        else
           render :new, status: :unprocessable_entity
        end
      end
    end

    def destroy
      @item.destroy
      redirect_to items_path(@user), status: :see_other
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_item
        @item = Item.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def item_params
        params.require(:item).permit(:description, :price)
      end
end
