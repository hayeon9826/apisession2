# Be sure to restart your server when you modify this file.

# Configure sensitive parameters which will be filtered from the log file.
Rails.application.config.filter_parameters += [:card_num1, :card_num2, :card_num3, :card_num4, :birthday, :expiry_month, :expiry_year, :password ]

# Rails.application.config.filter_parameters += [:password, :pwd_2digit, :card_number, :birth, :expiry]