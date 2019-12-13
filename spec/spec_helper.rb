require "bundler/setup"
require 'webmock/rspec'

require "iubenda_api"

def file_fixture(file_name)
  File.open(File.dirname(__FILE__) + '/support/fixtures/' + file_name, 'rb').read
end

def stub_api_request(http_method, path, status, path_params = {})
  api = "#{http_method.upcase} #{path} #{status}"
  case api
  # Subject APIs
  when 'GET /subjects/:id 200'
    stub_request(:get, "https://consent.iubenda.com/subjects/#{path_params[:id]}").
      to_return(status: 200, body: file_fixture('consent_solution/subjects/show.json'))
  when 'GET /subjects/:id 404'
    stub_request(:get, "https://consent.iubenda.com/subjects/#{path_params[:id]}").
      to_return(status: 404, body: file_fixture('consent_solution/404.json'))
  when 'GET /subjects/:id 401'
    stub_request(:get, "https://consent.iubenda.com/subjects/#{path_params[:id]}").
      to_return(status: 401, body: file_fixture('consent_solution/401.json'))
  when 'GET /subjects/:id 403'
    stub_request(:get, "https://consent.iubenda.com/subjects/#{path_params[:id]}").
      to_return(status: 403, body: file_fixture('consent_solution/403.json'))
  when 'GET /subjects 200'
    stub_request(:get, 'https://consent.iubenda.com/subjects').
      to_return(status: 200, body: file_fixture('consent_solution/subjects/list.json'))
  when 'GET /subjects 401'
    stub_request(:get, 'https://consent.iubenda.com/subjects').
      to_return(status: 401, body: file_fixture('consent_solution/401.json'))
  when 'GET /subjects 403'
    stub_request(:get, 'https://consent.iubenda.com/subjects').
      to_return(status: 403, body: file_fixture('consent_solution/403.json'))
  when 'POST /subjects 200'
    stub_request(:post, 'https://consent.iubenda.com/subjects').
      to_return(status: 200, body: file_fixture('consent_solution/subjects/create.json'))
  when 'POST /subjects 401'
    stub_request(:post, 'https://consent.iubenda.com/subjects').
      to_return(status: 401, body: file_fixture('consent_solution/401.json'))
  when 'POST /subjects 403'
    stub_request(:post, 'https://consent.iubenda.com/subjects').
      to_return(status: 403, body: file_fixture('consent_solution/403.json'))
  when 'PUT /subjects/:id 200'
    stub_request(:put, "https://consent.iubenda.com/subjects/#{path_params[:id]}").
      to_return(status: 200, body: file_fixture('consent_solution/subjects/update.json'))
  when 'PUT /subjects/:id 404'
    stub_request(:put, "https://consent.iubenda.com/subjects/#{path_params[:id]}").
      to_return(status: 404, body: file_fixture('consent_solution/404.json'))
  when 'PUT /subjects/:id 401'
    stub_request(:put, "https://consent.iubenda.com/subjects/#{path_params[:id]}").
      to_return(status: 401, body: file_fixture('consent_solution/401.json'))
  when 'PUT /subjects/:id 403'
    stub_request(:put, "https://consent.iubenda.com/subjects/#{path_params[:id]}").
      to_return(status: 403, body: file_fixture('consent_solution/403.json'))
  # Consent APIs
  when 'GET /consent/:id 200'
    stub_request(:get, "https://consent.iubenda.com/consent/#{path_params[:id]}").
      to_return(status: 200, body: file_fixture('consent_solution/consent/show.json'))
  when 'GET /consent/:id 404'
    stub_request(:get, "https://consent.iubenda.com/consent/#{path_params[:id]}").
      to_return(status: 404, body: file_fixture('consent_solution/404.json'))
  when 'GET /consent/:id 401'
    stub_request(:get, "https://consent.iubenda.com/consent/#{path_params[:id]}").
      to_return(status: 401, body: file_fixture('consent_solution/401.json'))
  when 'GET /consent/:id 403'
    stub_request(:get, "https://consent.iubenda.com/consent/#{path_params[:id]}").
      to_return(status: 403, body: file_fixture('consent_solution/403.json'))
  when 'GET /consent 200'
    stub_request(:get, 'https://consent.iubenda.com/consent').
      to_return(status: 200, body: file_fixture('consent_solution/consent/list.json'))
  when 'GET /consent 401'
    stub_request(:get, 'https://consent.iubenda.com/consent').
      to_return(status: 401, body: file_fixture('consent_solution/401.json'))
  when 'GET /consent 403'
    stub_request(:get, 'https://consent.iubenda.com/consent').
      to_return(status: 403, body: file_fixture('consent_solution/403.json'))
  when 'POST /consent 200'
    stub_request(:post, 'https://consent.iubenda.com/consent').
      to_return(status: 200, body: file_fixture('consent_solution/consent/create.json'))
  when 'POST /consent 401'
    stub_request(:post, 'https://consent.iubenda.com/consent').
      to_return(status: 401, body: file_fixture('consent_solution/401.json'))
  when 'POST /consent 403'
    stub_request(:post, 'https://consent.iubenda.com/consent').
      to_return(status: 403, body: file_fixture('consent_solution/403.json'))
  # LegalNotice APIs
  when 'GET /legal_notices/:identifier/:version 200'
    stub_request(:get, "https://consent.iubenda.com/legal_notices/#{path_params[:identifier]}/#{path_params[:version]}").
      to_return(status: 200, body: file_fixture('consent_solution/legal_notices/version.json'))
  when 'GET /legal_notices/:identifier/:version 401'
    stub_request(:get, "https://consent.iubenda.com/legal_notices/#{path_params[:identifier]}/#{path_params[:version]}").
      to_return(status: 401, body: file_fixture('consent_solution/401.json'))
  when 'GET /legal_notices/:identifier/:version 403'
    stub_request(:get, "https://consent.iubenda.com/legal_notices/#{path_params[:identifier]}/#{path_params[:version]}").
      to_return(status: 403, body: file_fixture('consent_solution/403.json'))
  when 'GET /legal_notices/:identifier/:version 404'
    stub_request(:get, "https://consent.iubenda.com/legal_notices/#{path_params[:identifier]}/#{path_params[:version]}").
      to_return(status: 404, body: file_fixture('consent_solution/404.json'))
  when 'GET /legal_notices/:identifier 200'
    stub_request(:get, "https://consent.iubenda.com/legal_notices/#{path_params[:identifier]}").
      to_return(status: 200, body: file_fixture('consent_solution/legal_notices/versions.json'))
  when 'GET /legal_notices/:identifier 401'
    stub_request(:get, "https://consent.iubenda.com/legal_notices/#{path_params[:identifier]}").
      to_return(status: 401, body: file_fixture('consent_solution/401.json'))
  when 'GET /legal_notices/:identifier 403'
    stub_request(:get, "https://consent.iubenda.com/legal_notices/#{path_params[:identifier]}").
      to_return(status: 403, body: file_fixture('consent_solution/403.json'))
  when 'GET /legal_notices 200'
    stub_request(:get, "https://consent.iubenda.com/legal_notices").
      to_return(status: 200, body: file_fixture('consent_solution/legal_notices/list.json'))
  when 'GET /legal_notices 401'
    stub_request(:get, "https://consent.iubenda.com/legal_notices").
      to_return(status: 401, body: file_fixture('consent_solution/401.json'))
  when 'GET /legal_notices 403'
    stub_request(:get, "https://consent.iubenda.com/legal_notices").
      to_return(status: 403, body: file_fixture('consent_solution/403.json'))
  when 'POST /legal_notices 200'
    stub_request(:post, "https://consent.iubenda.com/legal_notices").
      to_return(status: 200, body: file_fixture('consent_solution/legal_notices/create.json'))
  when 'POST /legal_notices 401'
    stub_request(:post, "https://consent.iubenda.com/legal_notices").
      to_return(status: 401, body: file_fixture('consent_solution/401.json'))
  when 'POST /legal_notices 403'
    stub_request(:post, "https://consent.iubenda.com/legal_notices").
      to_return(status: 403, body: file_fixture('consent_solution/403.json'))
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
