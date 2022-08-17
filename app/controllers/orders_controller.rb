class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = Order.new
  end

  def create
    order = current_user.orders.new(order_params)
    order.price = 10

    if order.save
      redirect_to "/", notice: "訂單建立成功"
      # 轉去刷卡頁面
    else
      redirect_to plans_path, notice: "系統正在忙碌中，請稍候再試"
    end
  end

  private

  def order_params
    params.require(:order).permit(:note)
  end
end
