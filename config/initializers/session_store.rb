if Rails.env == "production"
  Rails.application.config.session_store :active_record_store, key: "_crosswords", domain: "crosswords-api"
else
  Rails.application.config.session_store :active_record_store, key: "_crosswords"
end
