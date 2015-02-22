Bloccit::Application.routes.draw do



	resources :posts, :advertisement, :question

	get 'about' => 'welcome#about'

 root to: 'welcome#index'
end
