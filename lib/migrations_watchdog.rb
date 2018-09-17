require "migrations_watchdog/version"

module MigrationsWatchdog
  class Error < StandardError
  end

  def self.check
    raise Error
  end
end
