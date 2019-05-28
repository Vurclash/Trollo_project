class SidekicksController < ApplicationController
  before_action :set_sidekick, only: [:show, :edit, :destroy, :update]

  def index
    @sidekicks = Sidekick.all_sidekicks(current_user.id)
  end

  def show
  end

  def new
    @sidekick = Sidekick.new
  end

  def create
    @sidekick = Sidekick.create_sidekick(sidekick_params, current_user.id)
    redirect_to sidekicks_path
  end

  def edit
  end

  def update
    Sidekick.update_sidekick(@sidekick.id, sidekick_params)
    redirect_to sidekick_path(@sidekick)
  end

  def destroy
    Sidekick.delete_sidekick(@sidekick)
    redirect_to sidekicks_path
  end

  private

  def sidekick_params
    params.require(:sidekick).permit(:title, :power)
  end

  def set_sidekick
    @sidekick = Sidekick.single_sidekick(current_user.id, params[:id])
  end
end
