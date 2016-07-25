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
    @recipients = @subject.recipients
    @related_recipients = Kaminari.paginate_array(@recipients.all.sort_by{|t| t.recipient_name.downcase.sub(/^the |a |an /i,"")}).page(params[:page])
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
