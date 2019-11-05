require "bundler/setup"
require 'webmock/rspec'

require "iubenda_api"

def file_fixture(file_name)
  File.open(File.dirname(__FILE__) + '/support/fixtures/' + file_name, 'rb').read
end

def stub_api_request(http_method, path, status, path_params = {})
  api = "#{http_method.upcase} #{path} #{status}"
  case api
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
