class MessagesController < ApplicationController
  def new
  end

  def feedback
    ApplicationMailer.feedback(current_user.id, params[:title], params[:body]).deliver_now!
    redirect_to root_path, notice: t(".success")
  end
end
