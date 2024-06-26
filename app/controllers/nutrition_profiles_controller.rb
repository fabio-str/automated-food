class NutritionProfilesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_nutrition_profile
    
    def show
        @nutrition_profile = current_user.nutrition_profile
    end

    def new
        @nutrition_profile = current_user.nutrition_profile || current_user.build_nutrition_profile
    end

    def create
        @nutrition_profile = current_user.build_nutrition_profile(nutrition_profile_params)

        if current_user.nutrition_profile.nil?
            if @nutrition_profile.save
            redirect_to @nutrition_profile, notice: 'Nutrition profile was successfully created.'
            else
            render :new
            end
        else
            if @nutrition_profile.update(nutrition_profile_params)
            redirect_to @nutrition_profile, notice: 'Nutrition profile was successfully updated.'
            else
            render :edit, alert: 'Nutrition Profile could not be created. Try again.'
            end
        end
    end

    def update
        @nutrition_profile = current_user.nutrition_profile

        if @nutrition_profile.update(nutrition_profile_params)
          redirect_to @nutrition_profile, notice: 'Nutrition profile was successfully updated.'
        else
          render :edit,  alert: 'Nutrition Profile was not updated. Try again.'
        end
    end

    private

    def set_nutrition_profile
        @nutrition_profile = current_user.nutrition_profile
    end

    def nutrition_profile_params
        params.require(:nutrition_profile).permit(:sex, :age, :height, :weight, :activity_level, :health_goal, :daily_calorie_need)
    end
    
end
    