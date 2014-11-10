class ChargesController < ApplicationController

  # def index
  # end

  def new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @amount = (@post.price * 100).to_i
    @description = @post.caption

    customer = Stripe::Customer.create(
      # :email => 'example@stripe.com',
      :email => User.find(current_user.id).email,
      :card => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => @description,
      :currency => 'gbp'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to post_charges_path
  end

  # def show
  # end

end
