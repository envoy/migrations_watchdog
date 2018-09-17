require "test_helper"

class MigrationsWatchdogTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::MigrationsWatchdog::VERSION
  end

  describe "#check" do
    it "raises an error paths contain rails migrations and any other rb changes" do
      paths = [
        "app/models/migration_and_code.rb",
        "db/migrate/20180917180241_create_migration_and_codes.rb",
        "db/structure.sql",
        "spec/factories/migration_and_codes.rb",
        "spec/models/migration_and_code_spec.rb",
        "lib/tasks/some_task.rb",
        "config/initializer/foo.rb"
      ]

      assert_raises ::MigrationsWatchdog::Error do
        ::MigrationsWatchdog.check(paths)
      end
    end

    it "returns true if paths contains migration related files only" do
      paths = [
        "db/migrate/20180917180241_create_migration_and_codes.rb",
        "db/structure.sql"
      ]

      assert_equal ::MigrationsWatchdog.check(paths), true
    end

    it "returns true if paths contains app files only" do
      paths = [
        "app/models/migration_and_code.rb",
        "spec/factories/migration_and_codes.rb",
        "spec/models/migration_and_code_spec.rb",
        "lib/tasks/some_task.rb",
        "config/initializer/foo.rb"
      ]

      assert_equal ::MigrationsWatchdog.check(paths), true
    end
  end
end
