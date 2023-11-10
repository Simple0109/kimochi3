class RequestsController < ApplicationController
  before_action :set_request, only: [:edit, :show, :update, :destroy]

  def index
    @requests = Request.where(user_id: current_user.id)
  end

  def new
    @request = Request.new
  end

  def show;end

  def create
    @request = Request.new(request_params)
    binding.b
    if @request.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit;end

  def update
    if @request.update(request_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @request.destroy
    redirect_to root_path
  end

  private

  def request_params
    params.require(:request).permit(:group_id, :take, :execution_date, :image, :comment).merge(user_id: current_user.id)
  end

  def set_request
    @request = Request.find(params[:id])
  end

end
