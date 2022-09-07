before_action :customer_state, only: [:create]

protected
# 退会しているかを判断するメソッド
def customer_state
  ## 【処理内容1】 入力されたemailからアカウントを1件取得
  @customer = Customer.find_by(email: params[:customer][:email])
  ## アカウントを取得できなかった場合、このメソッドを終了する
  return if !@customer
  ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
  if @customer.valid_password?(params[:customer][:password]) && (@customer.is_active == false)
    ## 【処理内容3】退会していた場合ログイン不能
   redirect_to new_customer_session_path, notice:'このアカウントは退会しています。'
  end
end