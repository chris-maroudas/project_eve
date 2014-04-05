Rails.application.config.middleware.use OmniAuth::Builder do
  provider :steam, '7D29FD812A372A908187FEF2D76FAEBA'
end