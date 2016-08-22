class SubjectsController < ApplicationController
  before_action :find_subject, :only => [:show, :edit, :update, :destroy]
  layout 'page'
  helper_method :sort_column, :sort_direction

  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def show
    params[:sort] ||= 'sort_by_name'

    @recipients = @subject.recipients
    if params[:limit]
      @related_recipients = @recipients.order(sort_column + ' ' + sort_direction).includes(:category, :multimedia, :renderings).page(params[:page]).per(params[:limit])
    else
      @related_recipients = @recipients.order(sort_column + ' ' + sort_direction).includes(:category, :multimedia, :renderings).page(params[:page])
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    if current_user.admin?
      @subject = Subject.new(subject_params)
      if @subject.save
        redirect_to subjects_path
      else
        render :new
      end
    else
      redirect_to recipients_path, alert: "You do not have permission."
    end
  end

  def edit

  end

  def update
    if current_user.admin?
      if @subject.update_attributes(subject_params)
        redirect_to subjects_path, notice: "Successfully updated subject."
      else
        render :edit
      end
    else
      redirect_to recipients_path, alert: "You do not have permission."
    end
  end

  def destroy
    if current_user.admin?
      @subject.destroy

      redirect_to subjects_path
    else
      redirect_to recipients_path, alert: "You do not have permission."
    end
  end

  private
  def find_subject
    @subject = Subject.find(params[:id])
  end

  def sort_column
    Recipient.column_names.include?(params[:sort]) ? params[:sort] : 'sort_by_name'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
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
