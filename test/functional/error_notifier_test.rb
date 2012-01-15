require 'test_helper'

class ErrorNotifierTest < ActionMailer::TestCase
  test "occured" do
    mail = ErrorNotifier.occured
    assert_equal "Occured", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
