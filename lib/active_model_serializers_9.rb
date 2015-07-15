require 'active_model'
require 'active_model/serializer_9'
require 'active_model/serializer_9_support'
require 'active_model/serializer_9/version'
require 'active_model/serializer_9/railtie' if defined?(Rails)

begin
  require 'action_controller'
  require 'action_controller/serialization_9'
  require 'action_controller/serialization_test_case'

  ActiveSupport.on_load(:action_controller) do
    if ::ActionController::Serialization9.enabled
      ActionController::Base.send(:include, ::ActionController::Serialization9)
      ActionController::TestCase.send(:include, ::ActionController::SerializationAssertions)
    end
  end
rescue LoadError
  # rails not installed, continuing
end
