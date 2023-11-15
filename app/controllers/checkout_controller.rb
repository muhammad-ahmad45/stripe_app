class CheckoutController < ApplicationController

  def create
    local_product = Product.find(params[:id])
  
    # Create a Stripe Product
    stripe_product = Stripe::Product.create({
      name: local_product.title,
      type: 'good',  # You can adjust this based on your product type
    })
  
    # Create a Price object for the Stripe Product
    price = Stripe::Price.create({
      product: stripe_product.id,
      unit_amount: local_product.price * 100,  # convert price to cents
      currency: "usd",
    })
  
    # Create a Session with line_items using price_data
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price: price.id,
        quantity: 1
      }],
      mode: 'payment',
      success_url: root_url,
      cancel_url: root_url,
    })
  
    respond_to do |format|
      format.js  
    end
  end  

end