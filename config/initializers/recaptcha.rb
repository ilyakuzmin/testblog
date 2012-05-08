Recaptcha.configure do |config|
  config.public_key  = ENV['RECAPTCHA_PUBLIC_KEY']  || '6LfdN9ESAAAAAL9igVGPWZkdUV5hoLDSFbo0CPtu'
  config.private_key = ENV['RECAPTCHA_PRIVATE_KEY'] || '6LfdN9ESAAAAAKk_87f9L4tQbEUdzLGsUl5ig5Cz'
end
