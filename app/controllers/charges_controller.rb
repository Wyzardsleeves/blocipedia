class ChargesController < ApplicationController

  before_action :upgradeRevert

  def new
    @amount = 11_0

    @stripe_btn_data = {
      key: "#{Rails.configuration.stripe[:publishable_key]}",
      description: "Upgrading user to premium",
      amount: @amount
    }
  end

  def create
    @amount = 11_0

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
    current_user.toPremium
    flash[:notice] = "You have been upgraded to #{@current_user.role}!"
    redirect_to root_path

    rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
  end

  private
  def upgradeRevert
    if current_user.premium?
      current_user.toStandard
      @wiki = Wiki.all
      @wiki.where(user_id: current_user.id).update_all(access: false)
      redirect_to root_path
    end
  end
end
