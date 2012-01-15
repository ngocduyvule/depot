require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["foenix.skies@gmail.com"], mail.to
    assert_equal ["foenix.skies@gmail.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>Programming Ruby 1.9<\/td>/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["foenix.skies@gmail.com"], mail.to
    assert_equal ["foenix.skies@gmail.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>Programming Ruby 1.9<\/td>/, mail.body.encoded
  end

end
