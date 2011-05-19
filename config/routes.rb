J3face::Application.routes.draw do
  root to: 'twitter#show'
  match '/auth/twitter/callback' => 'twitter#avatar'
end
