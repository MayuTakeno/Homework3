class ApplicationController < ActionController::Base

before_action :authenticate_user!, except: [:top]

#devise機能使用前に'configure_permitted_parameters'メソッドの実行
before_action :configure_permitted_parameters, if: :devise_controller?

 #サインイン後の遷移先
  def after_sign_in_path_for(resource)
    books_path
  end

  #サインアウト後の遷移先
  def after_sign_out_path_for(resource)
    root_path
  end

  protected

    #ユーザ登録の際にユーザー名のデータ操作を許可
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
