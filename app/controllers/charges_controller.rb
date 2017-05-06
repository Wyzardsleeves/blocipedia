class ChargesController < ApplicationController
  def new
    @amount = 20_00

    @stripe_btn_data = {
      key: "#{Rails.configuration.stripe[:publishable_key]}",
      description: "Upgrading user to premium",
      amount: @amount
    }

    current_user.toPremium!
    flash[:notice] = "You have been upgraded to #{@current_user.role}!"
  end

  def create
    @amount = 20_00

    customer = Stripe::Customer.create(
      email: "current_user.email",
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "Upgrading user to premium",
      currency: 'usd'
    )

    #returning successful transaction
    if charge["paid"] == true
      current_user.toPremium!
      flash[:alert] = "You have been upgraded to #{@current_user.role}!"
    end

    current_user.toPremium!
    flash[:notice] = "You have been upgraded to #{@current_user.role}!"
    redirect_to root_path

    rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
  end

end
