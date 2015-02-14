class ShedulesController < ApplicationController

  def new
    @shedule = Shedule.new
    render 'form'
  end

  def index
    @shedules = Shedule.all.order(created_at: :desc)
  end

  def create
    shedule = Shedule.create!(permitted_request)
    lab_request = LabRequest.new(permitted_lab)
    lab_request.name = LabType.find(params[:shedule][:lab_type_id]).name
    lab_request.shedule_id = shedule.id

    lab_request.save!

    redirect_to :shedules
  end

  def edit
    @shedule = Shedule.find(params[:id])
    render 'form.html.erb'
  end

  def update
    #Shedule.update_all(permitted_request)
    redirect_to :shedules
  end

  def permitted_lab
    params.require(:shedule).permit(:tests, :due_date, :user_id)
  end

  def permitted_request
    params.require(:shedule).permit(:tests, :id, :max_recurrences, :due_date, :lab_type_id, :user_id, :frequency)
  end
end
