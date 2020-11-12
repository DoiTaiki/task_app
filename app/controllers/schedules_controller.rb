class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end
  
  def new
    @schedule = Schedule.new
  end
  
  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_day, :end_day, :all_day, :memo))
    if @schedule.save
      redirect_to schedules_path
      flash[:notice] = "ユーザーを新規登録しました"
    else
      render new_schedule_path
    end
  end
  
  def show
    @schedule = Schedule.find(params[:id])
  end
  
  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_day, :end_day, :all_day, :memo))
      flash[:notice] = "IDが「#{@schedule.id}」のスケジュールを更新しました"
      redirect_to schedules_path
    else
      render edit_schedule_path
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to schedules_path
  end
end
