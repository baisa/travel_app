Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['EnPDBBOmEHM27nDboiw56HRxu'], ENV['FoK3KEWC6NEYYE1jFJgFsIV8Gn1XKD8FNLu4ezIhyGZiKXszKv']
end