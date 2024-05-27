class ProfileController < ApplicationController
  def profile
    @user = current_user
    @profile_image = @user.profile_image || ProfileImage.new
  end

  def profile_update
    @user = current_user
    @profile_image = @user.profile_image || @user.build_profile_image

    if @profile_image.image.attached?
      @profile_image.image.purge
    end

    if @profile_image.update(profile_image_params)
      redirect_to profile_profile_path
    else
      render :profile
    end
  end

  private

  def profile_image_params
    params.require(:profile_image).permit(:image)
  end
end
