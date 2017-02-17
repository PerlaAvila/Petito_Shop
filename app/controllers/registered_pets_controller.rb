class RegisteredPetsController < ApplicationController
  def new
    @pet = RegisteredPet.new
  end

  def create
    parameters = params[:registered_pet]
    user = current_user
    @pet = RegisteredPet.new(registered_pet_params)
    if @pet.save
      user.registered_pets << @pet
      flash[:success] = "Mascota registrada exitosamente"
      redirect_to @pet
    else
      render 'form'
    end
  end

  def show
    @pet = RegisteredPet.find(params[:id])
    @user = @pet.user
  end


  def edit
    @pet = RegisteredPet.find(params[:id])
      unless current_user == @pet.user
        flash[:danger] = "No puedes editar a esta mascota"
        redirect_to @pet
      end
  end

  def update
    @pet = RegisteredPet.find(params[:id])
    if @pet.update_attributes(registered_pet_params)
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

  def delete_picture
    puts params
  end

  private


    def registered_pet_params
      params.require(:registered_pet).permit(:pet_name, :pet_age, :pet_disease, :pet_vaccines, :pet_info, :owner_name, :owner_phone, :avatar)
    end


    def must_be_owner
    unless current_user && @pet.user
      redirect_to show_path(@pet), notice: "No tienes los permisos para hacer esto"
    end
    end
end
