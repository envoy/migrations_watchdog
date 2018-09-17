require "migrations_watchdog/version"

module MigrationsWatchdog
  class Error < StandardError
  end

  def self.check(paths)
    migration_files = []
    others = []

    paths.each do |file|
      if file.match('\Adb/structure.sql') || file.match('\Adb/migrate')
        migration_files.push(file)
      elsif file.match('.*\.rb')
        # We could do a short circuit here but let's collect all files for
        # better error message
        others.push(file)
      end
    end

    if migration_files.size > 0 && others.size > 0
      raise Error.new("Migrations and app code detected. Move out the following files:\n#{others.join('\b')}")
    end

    true
  end
end
