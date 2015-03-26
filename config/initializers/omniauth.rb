Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, "7ecee102ae64a84d8ca4", "80d46b05f92c8ffe43dcbe1c65364d8fe537ca1d", scope: "user"
end
