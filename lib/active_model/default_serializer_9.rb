require 'active_model/serializable_9'

module ActiveModel
  # DefaultSerializer9
  #
  # Provides a constant interface for all items
  class DefaultSerializer9
    include ActiveModel::Serializable9

    attr_reader :object

    def initialize(object, options={})
      @object = object
      @wrap_in_array = options[:_wrap_in_array]
    end

    def as_json(options={})
      instrument('!serialize') do
        return [] if @object.nil? && @wrap_in_array
        hash = @object.as_json
        @wrap_in_array ? [hash] : hash
      end
    end
    alias serializable_hash as_json
    alias serializable_object as_json

    private
    def instrumentation_keys
      [:object, :wrap_in_array]
    end
  end
end
