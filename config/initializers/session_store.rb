if Rails.env == "production"
  # TODO: Change the app name to your app name
  Rails.application.config.session_store :active_record_store, key: "_my_app_name", domain: "my-app-api"
else
  Rails.application.config.session_store :active_record_store, key: "_my_app_name"
end
