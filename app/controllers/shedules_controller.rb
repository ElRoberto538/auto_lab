class ShedulesController < ApplicationController

  def new
    @shedule = Shedule.new
    render 'form'
  end

  def index
    @shedules = Shedule.all.order(created_at: :desc)
  end

  def create
    @shedule = Shedule.new(permitted_request)
    @shedule.user = current_user
    @shedule.save!

    #TODO: create first lab_request and send email

    redirect_to :shedules
  end

  def edit
    @shedule = Shedule.find(params[:id])
    render 'form.html.erb'
  end

  def update
    # @shedule = Shedule.update(permitted_request)
    redirect_to :shedules
  end

  def permitted_request
      params.require(:shedule).permit(:tests, :id, :max_recurrences, :due_date, :lab_type_id)
   end
end
