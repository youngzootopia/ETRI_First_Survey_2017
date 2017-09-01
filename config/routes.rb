Rails.application.routes.draw do
  get 'preference/get_html'
  get 'preference/get_data'
  get 'preference/survey_save'

  # index 페이지
  root 'home#index'
  get 'home/index'

  # 회원가입 마무리
  get 'home/finish_signup'
  get 'home/finish_signup_non_email'
  post 'home/finish_signup_commit'

  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks'}

  get ':controller(/:action(/:id))'
  post ':controller(/:action(/:id))'
  patch ':controller(/:action(/:id))'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
