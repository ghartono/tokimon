class TokimonsController < ApplicationController
  before_action :set_tokimon, only: [:show, :edit, :update, :destroy]


  # GET /tokimons
  # GET /tokimons.json
  def index
    @tokimons = Tokimon.all
  end

  # GET /tokimons/1
  # GET /tokimons/1.json
  def show
    if @tokimon.height < 50
	@height = "small"
    else if @tokimon.height < 100
        @height = "medium"
    else
        @height = "large"
    end
    end

    if @tokimon.weight < 50
        @weight = "light"
    else if @tokimon.weight < 100
        @weight = "normal weighted"
    else
        @weight = "heavy"
    end
    end

    
    
  end

  # GET /tokimons/new
  def new
    @tokimon = Tokimon.new
  end

  # GET /tokimons/1/edit
  def edit
  end

  # POST /tokimons
  # POST /tokimons.json
  def create
    @tokimon = Tokimon.new(tokimon_params)
  
    respond_to do |format|

      if @tokimon.save
        @tokimon.total = @tokimon.fly + @tokimon.fight + @tokimon.fire + @tokimon.water + @tokimon.electric + @tokimon.ice
	@tokimon.save
        format.html { redirect_to @tokimon, notice: 'Tokimon was successfully created.' }
        format.json { render :show, status: :created, location: @tokimon }

        @trainer1 = Trainer.find_by(id: @tokimon.trainer_id)
        @trainer1.level = Tokimon.where(trainer_id: @tokimon.trainer_id).count/3 + 1
	@trainer1.save

      else
        format.html { render :new }
        format.json { render json: @tokimon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tokimons/1
  # PATCH/PUT /tokimons/1.json
  def update

    prevtrainer = @tokimon.trainer_id

    @tokimon.update(tokimon_params)

    respond_to do |format|
      if @tokimon.update(tokimon_params)
        format.html { redirect_to @tokimon, notice: 'Tokimon was successfully updated.' }
        format.json { render :show, status: :ok, location: @tokimon }
	 @tokimon.total = @tokimon.fly + @tokimon.fight + @tokimon.fire + @tokimon.water + @tokimon.electric + @tokimon.ice
	 @tokimon.update(tokimon_params)

        @trainer1 = Trainer.find_by(id: @tokimon.trainer_id)
        @trainer1.level = Tokimon.where(trainer_id: @tokimon.trainer_id).count/3 + 1
	@trainer1.save

	@trainer2 = Trainer.find_by(id: prevtrainer)
        @trainer2.level = Tokimon.where(trainer_id: prevtrainer).count/3+1
        @trainer2.save
 

      else
        format.html { render :edit }
        format.json { render json: @tokimon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tokimons/1
  # DELETE /tokimons/1.json
  def destroy
    @tokimon.destroy

        @trainer1 = Trainer.find_by(id: @tokimon.trainer_id)
        @trainer1.level = Tokimon.where(trainer_id: @tokimon.trainer_id).count/3 + 1
	@trainer1.save

    respond_to do |format|
      format.html { redirect_to tokimons_url, notice: 'Tokimon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tokimon
      @tokimon = Tokimon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tokimon_params
      params.require(:tokimon).permit(:name, :height, :weight, :fly, :fight, :fire, :water, :electric, :ice, :total, :trainer_id)
    end
end
