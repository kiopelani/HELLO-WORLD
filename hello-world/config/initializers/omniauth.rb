Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "b5e01e97cf87437ab7a977d4d326e5af", "6317b109f6f84ba58308cd41179ecc30", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end
