# MigrationsWatchdog

This tool helps you check if the passed paths include migration and app code changes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'migrations_watchdog'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install migrations_watchdog

## Usage

You can call the CLI passing the paths to check:

```
$ migrations_watchdog app/models/foo.rb db/structure.sql
Migrations and app code detected. Move out the following files:
app/models/foo.rb
```

At [Envoy](https://envoy.com/jobs/) we use this tool in our CI flow to force separation between migration and app code changes in each pull request.

Our CircleCI configuration has a task like the following:

```
- run:
    name: Migrations and app code check
    type: shell
    command: git --no-pager diff --name-only HEAD $(git merge-base HEAD master) | xargs migrations_watchdog
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/envoy/migrations_watchdog. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MigrationsWatchdog project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/envoy/migrations_watchdog/blob/master/CODE_OF_CONDUCT.md).
