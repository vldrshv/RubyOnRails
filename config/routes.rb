Rails.application.routes.draw do
	get 'projects/new'
	get 'todos/new'
	get 'welcome/index'

	resources :projects do
  		resources :todos
  	end

	resources :todos
	
  	#root 'welcome#index'
  	root 'projects#index'
end
