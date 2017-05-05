Rails.application.routes.draw do
  
  resources :empresas
  resources :attachments, only: [:create,:destroy,:new,:show]
  resources :productos do
   get :views, on: :collection
 end
  resources :in_shopping_carts, only: [:create,:destroy]
  devise_for :users # Autenticacion de Usuario
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  post "registrosemails/create", as: :crear_email    #Se crea un post, Ese post, se encarga de recibir el correo que ingresa el usuario
  # y el alias que se le da con el as:, que se llama crear_email, es la ruta a donde se dirige cuando se recibe el correo, y se colocal
  # en el form_for
  post "/pagar", to: "payments#create"
  post "/payments/cards", to:"payments#process_card"

  get "/carrito", to: "shopping_carts#show"
  get "/agregar/producto_id", as: :agregar_carrito, to: "in_shopping_carts#create"
  get "/checkout", to: "payments#checkout"
  get "/ok", to: "creatives#payment_succed"
  get "/compras", to: "creatives#comprados"
  #get "/compras", to: "shopping_carts#comprados"
  get "/ordenes", to: "ordenes#index"

  get "/descargar/:id", to:"links#download"
  get "/descargar/:id/archivos/:attachment_id", to:"links#download_attachment",as: :download_attachment
  get "/invalid", to: "creatives#noregistro"
  

#Bloque que sirve, que cuando se autentice el usuario lo lleve a "inicio#index"
  authenticated :user do 
    root "productos#index_all"    
  end
  
  # #Bloque que sirve, que cuando no este autenticado muestre la vista de "inicio#noregistro"
  # as: :noregistro_root --->  es un nombre o alias que se le puede colocar  
  # unauthenticated :user do
  #     devise_scope :user do
  #       root "creatives#noregistro", as: :noregistro_root   # noregistro --->> se coloca en el controlador porque si se quita, quedan las mismas rutas 
  #     end
  # end
   unauthenticated :user do
        root "productos#index_all", as: :noregistro_root   # noregistro --->> se coloca en el controlador porque si se quita, quedan las mismas rutas 
  end
end



