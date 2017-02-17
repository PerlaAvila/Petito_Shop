# # Load the Rails application.
# require_relative 'application'
# Load the Rails application.
require 'rqrcode'
require 'rqrcode_png'

require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'mini_magick'
require File.expand_path('../application', __FILE__)


# Initialize the Rails application.
Rails.application.initialize!
