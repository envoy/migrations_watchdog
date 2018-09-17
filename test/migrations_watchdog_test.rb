require "test_helper"

class MigrationsWatchdogTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::MigrationsWatchdog::VERSION
  end

  def test_it_does_something_useful
    assert_raises ::MigrationsWatchdog::Error do
      ::MigrationsWatchdog.check
    end
  end
end
