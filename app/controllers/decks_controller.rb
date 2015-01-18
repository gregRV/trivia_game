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

	private

	def deck_params
		params.require(:deck).permit(:name)
	end
end
