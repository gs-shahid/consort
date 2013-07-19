require 'minitest/autorun'

class TestActiveRecord < Minitest::Test
  def setup
  end

  def test_active_record_has_one_mongoid_defined
    assert_equal 'method', defined? ActiveRecord::Base.has_one_mongoid
    assert_equal true, ActiveRecord::Base.respond_to?('has_one_mongoid')
  end

  # New form going forward.
  def test_active_record_has_many_mongoid_defined
    assert_equal 'method', defined? ActiveRecord::Base.has_many_mongoid
    assert_equal true, ActiveRecord::Base.respond_to?('has_many_mongoid')
  end

  # Deprecated form still available.
  def test_active_record_has_many_mongoids_defined
    assert_equal 'method', defined? ActiveRecord::Base.has_many_mongoids
    assert_equal true, ActiveRecord::Base.respond_to?('has_many_mongoids')
  end

  def test_active_record_belongs_to_mongoid_defined
    assert_equal 'method', defined? ActiveRecord::Base.belongs_to_mongoid
    assert_equal true, ActiveRecord::Base.respond_to?('belongs_to_mongoid')
  end

  def test_has_one_mongoid
    @u = Ungulate.new
    assert_equal true, @u.respond_to?('mango')
    assert_equal false, @u.respond_to?('mangos')
  end

  def test_has_many_mongoid
    @u = Ungulate.new
    assert_equal true, @u.respond_to?('bongos')
    assert_equal false, @u.respond_to?('bongo')
  end

  def test_belongs_to_mongoid
    @u = Ungulate.new
    assert_equal true, @u.respond_to?('congo')
    assert_equal false, @u.respond_to?('congos')
  end
end