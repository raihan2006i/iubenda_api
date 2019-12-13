# Ruby Client for Iubenda HTTP APIs

This ruby client is an unofficial client

[![Gem Version](https://badge.fury.io/rb/iubenda_api.svg)](https://badge.fury.io/rb/iubenda_api) [![Maintainability](https://api.codeclimate.com/v1/badges/4dbfa40f66bcac425417/maintainability)](https://codeclimate.com/github/raihan2006i/iubenda_api/maintainability) [![CircleCI](https://circleci.com/gh/raihan2006i/iubenda_api.svg?style=svg)](https://circleci.com/gh/raihan2006i/iubenda_api)

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
# Subject
subject_id = 'testsubject'
IubendaApi::ConsentSolution::Subject.create(
  id: subject_id,
  email: "john.doe@example.com",
  first_name: "John",
  last_name: "Doe",
  full_name: "John Doe",
  verified: false
) # -> #<IubendaApi::ConsentSolution::Subject id="testsubject" timestamp="2019-11-05T11:33:20.039Z">

IubendaApi::ConsentSolution::Subject.show(id) # -> #<IubendaApi::ConsentSolution::Subject email="john.doe@example.com" first_name="John" full_name=nil id="testsubject" last_name="Doe" owner_id="10240" preferences=nil timestamp="2019-11-05T11:33:20+00:00" verified=false>
IubendaApi::ConsentSolution::Subject.list # -> [#<IubendaApi::ConsentSolution::Subject email="john.doe@example.com" first_name="John" full_name=nil id="testsubject" last_name="Doe" owner_id="10240" preferences=nil timestamp="2019-11-05T11:33:20+00:00" verified=false>, ...]
IubendaApi::ConsentSolution::Subject.update(id, email: "john.snow@example.com", first_name: "John", last_name: "Snow", full_name: 'John Snow') # -> #<IubendaApi::ConsentSolution::Subject id="testsubject" timestamp="2019-11-05T11:33:20.039Z">

# Consent
IubendaApi::ConsentSolution::Consent.create(
  subject: {
    id: 'testsubject',
    email: 'subject@example.com',
    first_name: "John",
    last_name: "Doe",
    verified: false
  },
  preferences: {
    newsletter: false,
    privacy_policy: true
  }
) # -> #<IubendaApi::ConsentSolution::Consent id="00b654b3-ce4d-45c9-a8aa-9450551579c0" timestamp="2019-11-05T11:33:20.039Z">

IubendaApi::ConsentSolution::Consent.show('00b654b3-ce4d-45c9-a8aa-9450551579c0') # -> #<IubendaApi::ConsentSolution::Consent id="00b654b3-ce4d-45c9-a8aa-9450551579c0", ...>
IubendaApi::ConsentSolution::Consent.list(limit: 1) # -> [#<IubendaApi::ConsentSolution::Consent id="00b654b3-ce4d-45c9-a8aa-9450551579c0", ...>, ...]

# Legal Notice
# Single legal notice without multi-language content:
IubendaApi::ConsentSolution::LegalNotice.create(
  identifier: "privacy_policy",
  content: "privacy policy content"
) # -> #<IubendaApi::ConsentSolution::LegalNotice identifier="privacy_policy" version=1 timestamp="2019-12-13T14:56:00Z">
 
# Single legal notice with multi-language content:
IubendaApi::ConsentSolution::LegalNotice.create(
  identifier: "privacy_policy",
  content: {
   en: "privacy policy content",
   it: "contenuto della privacy policy"
  }
) # -> #<IubendaApi::ConsentSolution::LegalNotice identifier="privacy_policy" version=1 timestamp="2019-12-13T14:56:00Z">

# Multiple legal notice without multi-language content:
IubendaApi::ConsentSolution::LegalNotice.create_multiple([
  {
    identifier: "privacy_policy",
    content: "privacy policy content"
  },
  {
    identifier: "cookie_policy",
    content: "cookie policy content"
  }
]) # -> [#<IubendaApi::ConsentSolution::LegalNotice identifier="privacy_policy" version=1 timestamp="2019-12-13T14:56:00Z">, #<IubendaApi::ConsentSolution::LegalNotice identifier="cookie_policy" version=1 timestamp="2019-12-13T14:56:00Z">]

# Multiple legal notice with multi-language content:
IubendaApi::ConsentSolution::LegalNotice.create_multiple([
  {
    identifier: "privacy_policy",
    content: {
      en: "privacy policy content",
      it: "contenuto della privacy policy"
    }
  },
  {
    identifier: "cookie_policy",
    content: {
      en: "cookie policy content",
      it: "contenuto della cookie policy"
    }
  },
]) # -> [#<IubendaApi::ConsentSolution::LegalNotice identifier="privacy_policy" version=1 timestamp="2019-12-13T14:56:00Z">, #<IubendaApi::ConsentSolution::LegalNotice identifier="cookie_policy" version=1 timestamp="2019-12-13T14:56:00Z">]

IubendaApi::ConsentSolution::LegalNotice.versions('privacy_policy') # -> [#<IubendaApi::ConsentSolution::LegalNotice identifier="privacy_policy" version=1 timestamp="2019-11-07T16:18:05+00:00" content=#<Hashie::Mash>, ...]
IubendaApi::ConsentSolution::LegalNotice.version('privacy_policy', 1) # -> #<IubendaApi::ConsentSolution::LegalNotice identifier="privacy_policy" version=1 timestamp="2019-11-07T16:18:05+00:00" content=#<Hashie::Mash> 
IubendaApi::ConsentSolution::LegalNotice.list(limit: 1) # -> [#<IubendaApi::ConsentSolution::LegalNotice content=#<Hashie::Mash it="https://example.com/privacy_policy.pdf"> id="10298_privacy_policy" identifier="privacy_policy" owner_id="1000" timestamp="2019-11-22T14:12:06+00:00" version=1>, ...]

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/raihan2006i/iubenda_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the IubendaApi project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/iubenda_api/blob/master/CODE_OF_CONDUCT.md).
