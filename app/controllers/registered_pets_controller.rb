class RegisteredPetsController < ApplicationController
  def new
    @pet = RegisteredPet.new
  end

  def create
    puts "*" * 50
    parameters = params[:registered_pet]
    user = current_user.id
    puts user
    @pet = RegisteredPet.create(user_id: user, pet_name: parameters[:pet_name], pet_age: parameters[:pet_age], pet_disease: parameters[:pet_disease], pet_vaccines: parameters[:pet_vaccines], pet_info: parameters[:pet_info], owner_name: parameters[:owner_name], owner_phone: parameters[:owner_phone])
  end

  def show
    puts "*" * 50
    puts params
    p @pet = RegisteredPet.find(params[:id])
    @user = @pet.user
  end
end
