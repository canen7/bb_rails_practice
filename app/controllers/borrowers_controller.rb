class BorrowersController < ApplicationController
  
	before_action :set_borrower, only: [:show, :edit, :update, :destroy]

  def index
  	@borrowers = Borrower.all
  end

  def new
  	@borrower = Borrower.new
  end

  def create
  	# this is the equivalent of a var dump for my form data
  	# render :text => params.inspect
  	@borrower = Borrower.new(borrower_params)
  	#attempt to save borrower to database
  	if @borrower.save
  		flash[:success] = "succesfully created a new borrower. Get ready lenders to provide money"
  		redirect_to borrowers_path
  	else
  		#death
  		@errors = @borrower. errors.full_messages
  		render :new
  	end
  end

  def show
  end

  def edit
  end

  def update
  	if @borrower.update(borrower_params)
  		flash[:message] = "Succesfully updated this borrower"
  		redirec_to borrower_path(@borrower)
  	else
  		render :edit
  	end
  end

  private
  def borrower_params
  	params.require(:borrower).permit(:first_name, :last_name, :email, :password, :money, :purpose )
  end
  
  def set_borrower
  	#this runs automtically every time we want it, before the action
  	@borrower = Borrower.find(params[:id])	
  end

end
