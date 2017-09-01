# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

# video
Rails.application.config.assets.paths << "#{Rails.root}/app/assets/videos"

# CSS
Rails.application.config.assets.precompile += %w( custom/bootstrap/css/bootstrap.min.css )
Rails.application.config.assets.precompile += %w( custom/bootstrap/css/navvar_color.css )
Rails.application.config.assets.precompile += %w( custom/set_font.css )
Rails.application.config.assets.precompile += %w( custom/set_font.css )
Rails.application.config.assets.precompile += %w( custom/set_grid.css )
Rails.application.config.assets.precompile += %w( custom/jquery-ui-1.12.1.custom/jquery-ui.css )
  # for login
Rails.application.config.assets.precompile += %w( custom/login.css )
  # for signup, manage user
Rails.application.config.assets.precompile += %w( custom/signup.css )
Rails.application.config.assets.precompile += %w( custom/bootstrap/datepicker/css/bootstrap-datepicker3.css )
  # for filtering
Rails.application.config.assets.precompile += %w( custom/filtering.css )
  # for first survey
Rails.application.config.assets.precompile += %w( custom/video_js/video-js.css )
Rails.application.config.assets.precompile += %w( custom/modal.css )
Rails.application.config.assets.precompile += %w( custom/jquery.rateyo.min.css )
# font
Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/
# JavaScript
Rails.application.config.assets.precompile += %w( custom/jquery-3.1.1.js )
Rails.application.config.assets.precompile += %w( custom/jquery-3.1.1.min.js )
Rails.application.config.assets.precompile += %w( custom/bootstrap/js/bootstrap.min.js )
Rails.application.config.assets.precompile += %w( custom/jquery-ui-1.12.1.custom/jquery-ui.js )
  # for signup, manage user
Rails.application.config.assets.precompile += %w( custom/bootstrap/datepicker/js/bootstrap-datepicker.js )
Rails.application.config.assets.precompile += %w( custom/bootstrap/datepicker/locales/bootstrap-datepicker.kr.min.js )
Rails.application.config.assets.precompile += %w( custom/datepicker.js )
Rails.application.config.assets.precompile += %w( custom/no-kor.js )
# for first survey
Rails.application.config.assets.precompile += %w( custom/video_js/video.js )
Rails.application.config.assets.precompile += %w( custom/video_control_2.js )
Rails.application.config.assets.precompile += %w( custom/video_control_2-2.js )
Rails.application.config.assets.precompile += %w( custom/video_control_test.js )
Rails.application.config.assets.precompile += %w( custom/jquery.rateyo.min.js )

# for second survey
Rails.application.config.assets.precompile += %w( custom/image_picker/image-picker.min.js )
Rails.application.config.assets.precompile += %w( custom/video_control_first.js )
Rails.application.config.assets.precompile += %w( custom/image_picker/image-picker.min.css )
