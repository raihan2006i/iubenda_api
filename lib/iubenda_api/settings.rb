ApiStruct::Settings.configure do |config| # :nodoc:
  config.endpoints = {
    consent_solution_api: {
      root: 'https://consent.iubenda.com',
      headers: {
        'ApiKey': ENV['IUBENDA_API_KEY'],
        'Content-Type': 'application/json'
      }
    }
  }
end
