class NutritionProfilesController < ApplicationController
    
    before_action :authenticate_user!
    before_action :set_nutrition_profile, only: [:edit, :update]
    
    def edit
    end

    def update
    if @nutrition_profile.update(nutrition_profile_params)
        redirect_to user_path(current_user), notice: 'Nutrition Profile was successfully updated.'
    else
        render :edit
    end
    end

    private

    def set_nutrition_profile
    @user = User.find(params[:user_id])
    @nutrition_profile = @user.nutrition_profile
    end

    def nutrition_profile_params
    params.require(:nutrition_profile).permit(:sex, :age, :height, :weight, :activity_level, :health_goal)
    end
    
end
    