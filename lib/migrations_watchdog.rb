require "migrations_watchdog/version"

module MigrationsWatchdog
  class Error < StandardError
  end

  def self.check(paths)
    raise Error
  end
end
