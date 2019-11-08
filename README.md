# Ruby Client for Iubenda HTTP APIs

This ruby client is an unofficial client

[![Gem Version](https://badge.fury.io/rb/iubenda_api.svg)](https://badge.fury.io/rb/iubenda_api) [![CircleCI](https://circleci.com/gh/raihan2006i/iubenda_api.svg?style=svg)](https://circleci.com/gh/raihan2006i/iubenda_api)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'iubenda_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iubenda_api

## Usage

This gem expects that you have already set `IUBENDA_API_KEY` environment variable. Use your Iubenda `Private key`

```ruby
id = 'testsubject'

IubendaApi::ConsentSolution::Subject.create(
  id: id,
  email: "john.doe@example.com",
  first_name: "John",
  last_name: "Doe",
  full_name: "John Doe",
  verified: false
) # -> #<IubendaApi::ConsentSolution::Subject id="testsubject" timestamp="2019-11-05T11:33:20.039Z">

IubendaApi::ConsentSolution::Subject.show(id) # -> #<IubendaApi::ConsentSolution::Subject email="john.doe@example.com" first_name="John" full_name=nil id="testsubject" last_name="Doe" owner_id="10240" preferences=nil timestamp="2019-11-05T11:33:20+00:00" verified=false>
IubendaApi::ConsentSolution::Subject.list # -> [#<IubendaApi::ConsentSolution::Subject email="john.doe@example.com" first_name="John" full_name=nil id="testsubject" last_name="Doe" owner_id="10240" preferences=nil timestamp="2019-11-05T11:33:20+00:00" verified=false>, ...]
IubendaApi::ConsentSolution::Subject.update(id, email: "john.snow@example.com", first_name: "John", last_name: "Snow", full_name: 'John Snow') # -> #<IubendaApi::ConsentSolution::Subject id="testsubject" timestamp="2019-11-05T11:33:20.039Z">
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

TODO:
* Implement `IubendaApi::ConsentSolution::Consent` entity
* Implement `IubendaApi::ConsentSolution::LegalNotice` entity

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/raihan2006i/iubenda_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the IubendaApi project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/iubenda_api/blob/master/CODE_OF_CONDUCT.md).
