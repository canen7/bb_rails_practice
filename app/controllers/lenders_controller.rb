class LendersController < ApplicationController

	before_action :set_lender, only: [:show, :edit, :update, :destroy]


  def index
  	@lenders = Lender.all
  end

  def new
  	@lender = Lender.new
  end

  def create
  	# this is the equivalent of a var dumpo for my form data
    # render :text => params.inspect
    @lender = Lender.new(lender_params)
    # attempt to save lender to database
    if @lender.save
      flash[:success] = 'succefully created a new lender. Money will rain down from heaven'
      redirect_to lenders_path
    else
      #death
      @errors = @lender.errors.full_messages
      render :new
    end
  end

  def show
  end

  def edit
  end

   def update
    if @lender.update(lender_params)
      flash[:message] = "Succesfully updated this lender"
      redirect_to lender_path(@lender)    
    else
      render :edit
    end

  end

  def destroy
  	render :text => params.inspect
  	@lender.destroy(lender_params)
  	flash[:message] = "Forever deleted that lender"
  	# redirect to new_lender_path
  end

  private 
  def lender_params
   params.require(:lender).permit(:first_name, :last_name, :email, :password, :money )
  end

  def set_lender
      #this runs every time we need it to automatically before the action
      @lender= Lender.find(params[:id])
  end

end
