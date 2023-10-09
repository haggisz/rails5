# Rails.application.config.i18n.default_locale = :ja
# I18n.default_locale = :ja

# Where the I18n library should search for translation files
I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

#アプリケーションで有効とする言語を指定
I18n.available_locales = :ja

#デフォルトの言語を指定
I18n.default_locale = :ja
