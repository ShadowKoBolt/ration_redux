class MealsController < ApplicationController
  before_action :set_plan
  before_action :set_day
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  # GET /meals
  # GET /meals.json
  def index
    respond_to do |format|
      format.html { redirect_to [@plan, @day] }
      format.json { @meals = @day.meals }
    end
  end

  # GET /meals/1
  # GET /meals/1.json
  def show
  end

  # GET /meals/new
  def new
    @meal = Meal.new(meal_params)
  end

  # GET /meals/1/edit
  def edit
  end

  # POST /meals
  # POST /meals.json
  def create
    @meal = @day.meals.build(meal_params)

    respond_to do |format|
      if @meal.save
        format.html { redirect_to [@plan, @day], notice: 'Meal was successfully created.' }
        format.json { render :show, status: :created, location: @meal }
      else
        format.html { render :new }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meals/1
  # PATCH/PUT /meals/1.json
  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to [@plan, @day], notice: 'Meal was successfully updated.' }
        format.json { render :show, status: :ok, location: @meal }
      else
        format.html { render :edit }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to [@plan, @day], notice: 'Meal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_plan
      @plan = current_user.plans.find(params[:plan_id])
    end

    def set_day
      @day = @plan.days.find(params[:day_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = @day.meals.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_params
      params.require(:meal).permit(:edible_type_and_id, :day_id, :slot, :amount)
    end
end
