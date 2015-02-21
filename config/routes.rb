Bloccit::Application.routes.draw do

	resources :posts, :advertisement

	get 'about' => 'welcome#about'

 root to: 'welcome#index'
end
