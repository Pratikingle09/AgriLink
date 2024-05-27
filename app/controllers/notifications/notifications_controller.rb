module Notifications
  class NotificationsController < Notifications::ApplicationController
    def index
      if user_signed_in?

      @notifications = notifications.includes(:actor).order("id desc").page(params[:page])

      unread_ids = @notifications.reject(&:read?).select(&:id)
      Notification.read!(current_user, unread_ids)

      @notification_groups = @notifications.group_by { |note| note.created_at.to_date }
    else 
      redirect_to main_app.error_index_path
    end
    end

    def read
      Notification.read!(current_user, params[:ids])
      render json: { ok: 1 }
    end

    def show
      notifications.delete_all
      redirect_to notifications_path
    end

    private
      def notifications
        raise "You need reqiure user login for /notifications page." unless current_user
        Notification.where(user_id: current_user.id)
      end
  end
end
