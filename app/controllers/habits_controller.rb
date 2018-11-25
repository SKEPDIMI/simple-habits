class HabitsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  # GET /
  def index
    # please check and update habits status
    @habits = current_user.habits
    render 'habits/index'
  end

  # POST /habits/new
  def create
    if !user_signed_in?
      return head :unauthorized
    end

    @habit = current_user.habits.new(habit_params)

    if @habit.save
      # day should be deleted if it was completed...
      render json: {}, status: :created
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  # POST /habits/:id/complete
  # def complete
  #   habit = Habit.find(params[:id])
  #   return render 'habits/index', alert: 'Habit does not exist' if !habit
  #   habit.complete = true
  #   if habit.save
  #     # check to update day
  #     render 'habits/index'
  #   else
  #     render 'habits/index', alert: 'Could not save changes'
  #   end
  # end

  private
  def habit_params
    params.require(:habit).permit(:title)
  end
end
