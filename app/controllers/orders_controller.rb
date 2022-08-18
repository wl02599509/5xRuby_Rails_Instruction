class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_order, only: [:pay, :submit_order]

  def new
    @order = Order.new
  end

  def create
    order = current_user.orders.new(order_params)
    order.price = 10

    if order.save
      redirect_to pay_order_path(id: order.serial), notice: "訂單建立成功"
      # 轉去刷卡頁面
    else
      redirect_to plans_path, notice: "系統正在忙碌中，請稍候再試"
    end
  end

  def pay
    @token = gateway.client_token.generate
  end

  def submit_order
    result = gateway.transaction.sale(
      amount: @order.price,
      payment_method_nonce: params[:nonce]
    )

    if result.success?
      @order.pay!
      redirect_to '/', notice: '謝謝乾爹！'
    else
      @order.fail!
      redirect_to '/', notice: '交易失敗，請乾爹再試一次'
    end
  end

  private

  def order_params
    params.require(:order).permit(:note)
  end

  def gateway
    gateway = Braintree::Gateway.new(
      :environment => :sandbox,
      :merchant_id => '2n74qzhsxxvvrsxc',
      :public_key => '6f8qvkwsjfzzy454',
      :private_key => '9a4486bf833f06dd729bfd35120b96ba',
    )
  end

  def find_order
    @order = Order.find_by!(serial: params[:id])
  end
end
