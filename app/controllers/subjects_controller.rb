class SubjectsController < ApplicationController
  before_action :find_subject, :only => [:show, :edit, :update, :destroy]
  layout 'page'

  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def show

  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to subjects_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    @subject.update_attributes(subject_params)

    redirect_to subjects_path
  end

  def destroy
    @subject.destroy

    redirect_to subjects_path
  end

  private
  def find_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(
      :subject_name,
      recipient_ids: [],
      recipient_attributes: [
        :id,
        :recipient_name]
    )
  end
end
