class RegisteredPetsController < ApplicationController
  def new
    @pet = RegisteredPet.new
  end

  def create
    @pet = RegisteredPet.new(pet_params)
    # puts pet_params
    # pet_params.pet_name
    # if @pet.save
    #   puts "*" * 50
    #   flash[:info] = "Tu registro se creó exitosamente!"
    #   redirect_to registered_pet_path(@pet.id)
    # else
    #   render 'new'
    # end
    parameters = params[:registered_pet]
    user = current_user.id
    @pet = RegisteredPet.new(user_id: user, pet_name: parameters[:pet_name], pet_age: parameters[:pet_age], pet_disease: parameters[:pet_disease], pet_vaccines: parameters[:pet_vaccines], pet_info: parameters[:pet_info], owner_name: parameters[:owner_name], owner_phone: parameters[:owner_phone])

    if @pet.save
      flash[:success] = "Mascota registrada exitosamente"
      redirect_to @pet
    else
      render 'new'
    end
  end

  def show
    @pet = RegisteredPet.find(params[:id])
    @user = @pet.user
  end


  def edit
    @pet = RegisteredPet.find(params[:id])
      unless current_user == @pet.user
        redirect_to(@pet, notice: "No puedes editar a esta mascota") and return
      end
  end

  def update
    @pet = RegisteredPet.find(params[:id])
    if @pet.update_attributes(pet_params)
      flash[:success] = "Cambios guardados exitosamente!"
      redirect_to @pet
    else
      render 'edit'
    end
  end

  def destroy
    RegisteredPet.find(params[:id]).destroy
    flash[:success] = "Mascota eliminada"
    redirect_to user_path(current_user)
  end


  private
    def pet_params
      params.require(:registered_pet).permit(:pet_name, :pet_age, :pet_disease, :pet_vaccines, :pet_info, :owner_name, :owner_phone)
    end

    def must_be_owner
    unless current_user && @pet.user
      redirect_to show_path(@pet), notice: "No tienes los permisos para hacer esto"
    end
  end
end
