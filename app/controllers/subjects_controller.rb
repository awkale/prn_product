class SubjectsController < ApplicationController
  before_action :find_subject, :only => [:show, :edit, :update, :destroy]

  def index
    @subjects = Subject.all
    authorize Subject
  end

  def new
    @subject = Subject.new
    authorize @subject
  end

  def show
    @related_recipients = @subject.recipients
    @search = @related_recipients.ransack(params[:q])
    @search.sorts = 'sort_by_name asc' if @search.sorts.empty?
    @related_recipients = @search.result(distinct: true)
                         .includes(:category, :multimedia)
                         .page(params[:page]).per(params[:limit])
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
      if @subject.update_attributes(subject_params)
        redirect_to subjects_path, notice: "Successfully updated subject."
      else
        render :edit
      end
  end

  def destroy
      @subject.destroy

      redirect_to subjects_path
  end

  private
  def find_subject
    @subject = Subject.friendly.find(params[:id])
    authorize @subject
  end

  def subject_params
    params.require(:subject).permit(
      :subject_name,
      :description,
      recipient_ids: [],
      recipient_attributes: [
        :id,
        :recipient_name]
        )
  end
end
