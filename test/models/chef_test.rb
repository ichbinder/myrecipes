require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(chefname: 'jakob', email: 'jakob.warnow@gmx.de')
  end

  test 'should be valid' do
    assert @chef.valid?
  end

  test 'name chuld be present' do
    @chef.chefname = ' '
    assert_not @chef.valid?
  end

  test 'name shuld be less then 30 characters' do
    @chef.chefname = 'a' * 31
    assert_not @chef.valid?
  end

  test 'email shuld be present' do
    @chef.email = ' '
    assert_not @chef.valid?
  end

  test 'email shuld not be over 255 characters' do
    @chef.email = 'a' * 250 + '@gmx.de'
    assert_not @chef.valid?
  end

  test 'email shuld accept correct format' do
    valid_emails = %w[user@example.com wir@gmail.com test@gmx.de los@yahoo.com]
    valid_emails.each do |valids|
      @chef.email = valids
      assert @chef.valid?, "#{valids.inspect} shuld be valid"
    end
  end

  test 'email shuld reject invalid addresses' do
    invalid_emails = %w[user@example wir@gmail,com test.gmx.de los@yahoo+de.com]
    invalid_emails.each do |valids|
      @chef.email = valids
      assert_not @chef.valid?, "#{valids.inspect} shuld be invalid"
    end
  end

  test 'emial shuld be unique' do
    duplicat_chef = @chef.dup
    duplicat_chef.email = @chef.email.upcase
    @chef.save
    assert_not duplicat_chef.valid?
  end

  test 'email shuld be case insensitive' do
  end
end
