class DecksController < ApplicationController
	def new
		@user = current_user
		@deck = @user.decks.new
	end

	def create
		deck = current_user.decks.new(deck_params)
		if deck.save
			flash[:success] = "Deck created"
			redirect_to user_deck_path(current_user, deck)
		end
	end

	def show
		@deck = Deck.find(params[:id])
	end

	def edit
		@deck = Deck.find(params[:id])
		@user = User.find(@deck.user_id)
	end

	def update
		@deck = Deck.find(params[:id])
		@user = User.find(@deck.user_id)
		if @deck.update(deck_params)
			redirect_to user_deck_url(@user, @deck), flash: {success: "Updated Deck"}
		else
			flash.now[:notice] = "Failed to update Deck"
			render 'edit'
		end
	end

	def destroy
		Deck.destroy(params[:id]) ? (flash[:notice] = "Deleted Deck") : (flash[:notice] = "Failed to delete Deck")
		redirect_to user_url(params[:user_id])
	end

	private

	def deck_params
		params.require(:deck).permit(:name)
	end
end
