require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Itlookup
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    # config.app_generators.scaffold_controller :responders_controller
    #
    # # Do not swallow errors in after_commit/after_rollback callbacks.
    # config.active_record.raise_in_transactional_callbacks = true

    config.react.addons = true
  end
end
