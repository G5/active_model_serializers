module ActiveModel
  class Railtie < Rails::Railtie
    initializer 'generators_9' do |app|
      app.load_generators
      require 'active_model/serializer_9/generators/serializer/serializer_generator'
      require 'active_model/serializer_9/generators/serializer/scaffold_controller_generator'
      require 'active_model/serializer_9/generators/resource_override'
    end

    initializer 'include_routes.active_model_serializer_9' do |app|
      ActiveSupport.on_load(:active_model_serializers_9) do
        include app.routes.url_helpers
      end
    end
  end
end

ActiveSupport.run_load_hooks(:active_model_serializers_9, ActiveModel::Serializer9)
