# frozen_string_literal: true

class InterviewsController < ApplicationController
  def show
    @interview = Interview.find(params[:id])
  end

  def new
    @interview = Interview.new
    @organization = current_panelist.organization
    @panelists = @organization.panelists
  end

  def create
    @interview = Interview.new(interview_params)
    if @interview.save
      redirect_to organization_path(current_panelist.organization)
    else
      redirect_to organization_path(current_panelist.organization), alert: @interview.errors.full_messages.join(', ')
    end
  end

  def update
    @interview = Interview.find(params[:id])
    if @interview.update(interview_params)
      redirect_to @interview
    else
      render :edit
    end
  end

  private

  def interview_params
    params.require(:interview).permit(:round, :verdict, :feedback, :start_time, :panelist_id, :candidate_id)
  end
end
