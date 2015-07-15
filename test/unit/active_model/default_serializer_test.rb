require 'test_helper'

module ActiveModel
  class DefaultSerializer9
    class Test < Minitest::Test
      def test_serialize_objects
        assert_equal(nil, DefaultSerializer9.new(nil).serializable_object)
        assert_equal(1, DefaultSerializer9.new(1).serializable_object)
        assert_equal('hi', DefaultSerializer9.new('hi').serializable_object)
      end
    end
  end
end
