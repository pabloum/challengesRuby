require 'minitest/autorun'
require './directorio'

class TelefonoTest < Minitest::Test

  def setup
    @iphone = Telefono.new
  end

  def test_class_of_instance
    assert_instance_of(Telefono, @iphone)
  end

  def test_llamar
    assert_equal false,@iphone.llamar("Juan",123)
    assert_equal true,@iphone.llamar("Yerry Mina","1194")
  end

end
