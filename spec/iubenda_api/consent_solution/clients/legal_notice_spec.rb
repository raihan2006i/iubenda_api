RSpec.describe IubendaApi::ConsentSolution::Clients::LegalNotice do
  let(:client) { IubendaApi::ConsentSolution::Clients::LegalNotice.new }
  let(:identifier) { 'privacy_policy' }
  let(:version) { 1 }

  describe '#version' do
    let(:response) { client.version(identifier, 1) }

    context 'api authorized and legal notice version found' do
      before do
        stub_api_request(:get, '/legal_notices/:identifier/:version', 200, identifier: identifier, version: 1)
      end

      it 'returns a success response' do
        expect(response).to be_a_kind_of(Dry::Monads::Result::Success)
        expect(response.success?).to be(true)
      end

      it 'ensures response has legal notice object' do
        expect(response.success).to be_a_kind_of(Hash)
        expect(response.success).to have_key(:identifier)
        expect(response.success).to have_key(:timestamp)
        expect(response.success).to have_key(:version)
        expect(response.success).to have_key(:content)
      end
    end

    context 'api authorized but legal notice version not found' do
      before do
        stub_api_request(:get, '/legal_notices/:identifier/:version', 404, identifier: identifier, version: 1)
      end

      it 'returns a failure response with not_found status' do
        expect(response).to be_a_kind_of(Dry::Monads::Result::Failure)
        expect(response.failure).to be_a_kind_of(ApiStruct::Errors::Client)
        expect(response.failure?).to be(true)
        expect(response.failure.status.not_found?).to be(true)
      end
    end

    context 'api unauthorized' do
      before do
        stub_api_request(:get, '/legal_notices/:identifier/:version', 401, identifier: identifier, version: 1)
      end

      it 'returns a failure response with unauthorized status' do
        expect(response).to be_a_kind_of(Dry::Monads::Result::Failure)
        expect(response.failure).to be_a_kind_of(ApiStruct::Errors::Client)
        expect(response.failure?).to be(true)
        expect(response.failure.status.unauthorized?).to be(true)
      end
    end

    context 'api forbidden' do
      before do
        stub_api_request(:get, '/legal_notices/:identifier/:version', 403, identifier: identifier, version: 1)
      end

      it 'returns a failure response with forbidden status' do
        expect(response).to be_a_kind_of(Dry::Monads::Result::Failure)
        expect(response.failure).to be_a_kind_of(ApiStruct::Errors::Client)
        expect(response.failure?).to be(true)
        expect(response.failure.status.forbidden?).to be(true)
      end
    end
  end

  describe '#versions' do
    let(:response) { client.versions(identifier) }

    context 'api authorized' do
      before do
        stub_api_request(:get, '/legal_notices/:identifier', 200, identifier: identifier)
      end

      it 'returns a success response' do
        expect(response).to be_a_kind_of(Dry::Monads::Result::Success)
        expect(response.success?).to be(true)
      end

      it 'ensures response has list of legal notice objects' do
        expect(response.success).to be_a_kind_of(Array)
        expect(response.success).to all(have_key(:identifier))
        expect(response.success).to all(have_key(:timestamp))
        expect(response.success).to all(have_key(:id))
        expect(response.success).to all(have_key(:owner_id))
        expect(response.success).to all(have_key(:version))
        expect(response.success).to all(have_key(:content))
      end
    end

    context 'api unauthorized' do
      before do
        stub_api_request(:get, '/legal_notices/:identifier', 401, identifier: identifier)
      end

      it 'returns a failure response with unauthorized status' do
        expect(response).to be_a_kind_of(Dry::Monads::Result::Failure)
        expect(response.failure).to be_a_kind_of(ApiStruct::Errors::Client)
        expect(response.failure?).to be(true)
        expect(response.failure.status.unauthorized?).to be(true)
      end
    end

    context 'api forbidden' do
      before do
        stub_api_request(:get, '/legal_notices/:identifier', 403, identifier: identifier)
      end

      it 'returns a failure response with forbidden status' do
        expect(response).to be_a_kind_of(Dry::Monads::Result::Failure)
        expect(response.failure).to be_a_kind_of(ApiStruct::Errors::Client)
        expect(response.failure?).to be(true)
        expect(response.failure.status.forbidden?).to be(true)
      end
    end
  end

  describe '#list' do
    let(:response) { client.list }

    context 'api authorized' do
      before do
        stub_api_request(:get, '/legal_notices', 200)
      end

      it 'returns a success response' do
        expect(response).to be_a_kind_of(Dry::Monads::Result::Success)
        expect(response.success?).to be(true)
      end

      it 'ensures response has list of consent objects' do
        expect(response.success).to all(be_a_kind_of(Hash))
        expect(response.success).to all(have_key(:identifier))
        expect(response.success).to all(have_key(:timestamp))
        expect(response.success).to all(have_key(:id))
        expect(response.success).to all(have_key(:owner_id))
        expect(response.success).to all(have_key(:version))
        expect(response.success).to all(have_key(:content))
      end
    end

    context 'api unauthorized' do
      before do
        stub_api_request(:get, '/legal_notices', 401)
      end

      it 'returns a failure response with unauthorized status' do
        expect(response).to be_a_kind_of(Dry::Monads::Result::Failure)
        expect(response.failure).to be_a_kind_of(ApiStruct::Errors::Client)
        expect(response.failure?).to be(true)
        expect(response.failure.status.unauthorized?).to be(true)
      end
    end

    context 'api forbidden' do
      before do
        stub_api_request(:get, '/legal_notices', 403)
      end

      it 'returns a failure response with forbidden status' do
        expect(response).to be_a_kind_of(Dry::Monads::Result::Failure)
        expect(response.failure).to be_a_kind_of(ApiStruct::Errors::Client)
        expect(response.failure?).to be(true)
        expect(response.failure.status.forbidden?).to be(true)
      end
    end
  end

  describe '#create' do
    let(:response) { client.create(identifier: identifier, content: 'privacy policy content') }

    context 'api authorized' do
      before do
        stub_api_request(:post, '/legal_notices', 200)
      end

      it 'returns a success response' do
        expect(response).to be_a_kind_of(Dry::Monads::Result::Success)
        expect(response.success?).to be(true)
      end

      it 'ensures response has legal notice object' do
        expect(response.success).to be_a_kind_of(Hash)
        expect(response.success).to have_key(:identifier)
        expect(response.success).to have_key(:timestamp)
        expect(response.success).to have_key(:version)
      end
    end

    context 'api unauthorized' do
      before do
        stub_api_request(:post, '/legal_notices', 401)
      end

      it 'returns a failure response with unauthorized status' do
        expect(response).to be_a_kind_of(Dry::Monads::Result::Failure)
        expect(response.failure).to be_a_kind_of(ApiStruct::Errors::Client)
        expect(response.failure?).to be(true)
        expect(response.failure.status.unauthorized?).to be(true)
      end
    end

    context 'api forbidden' do
      before do
        stub_api_request(:post, '/legal_notices', 403)
      end

      it 'returns a failure response with forbidden status' do
        expect(response).to be_a_kind_of(Dry::Monads::Result::Failure)
        expect(response.failure).to be_a_kind_of(ApiStruct::Errors::Client)
        expect(response.failure?).to be(true)
        expect(response.failure.status.forbidden?).to be(true)
      end
    end
  end

  describe '#create_multiple' do
    let(:response) {
      client.create_multiple(
        [
          {identifier: 'privacy_policy', content: 'privacy policy content'},
          {identifier: 'cookie_policy', content: 'cookie policy content'}
        ]
      )
    }

    context 'api authorized' do
      before do
        stub_request(:post, "https://consent.iubenda.com/legal_notices").
          to_return(status: 200, body: file_fixture('consent_solution/legal_notices/create_multiple.json'))
      end

      it 'returns a success response' do
        expect(response).to be_a_kind_of(Dry::Monads::Result::Success)
        expect(response.success?).to be(true)
      end

      it 'ensures response has legal notice object' do
        expect(response.success).to be_a_kind_of(Array)
        expect(response.success).to all(have_key(:identifier))
        expect(response.success).to all(have_key(:timestamp))
        expect(response.success).to all(have_key(:version))
      end
    end

    context 'api unauthorized' do
      before do
        stub_api_request(:post, '/legal_notices', 401)
      end

      it 'returns a failure response with unauthorized status' do
        expect(response).to be_a_kind_of(Dry::Monads::Result::Failure)
        expect(response.failure).to be_a_kind_of(ApiStruct::Errors::Client)
        expect(response.failure?).to be(true)
        expect(response.failure.status.unauthorized?).to be(true)
      end
    end

    context 'api forbidden' do
      before do
        stub_api_request(:post, '/legal_notices', 403)
      end

      it 'returns a failure response with forbidden status' do
        expect(response).to be_a_kind_of(Dry::Monads::Result::Failure)
        expect(response.failure).to be_a_kind_of(ApiStruct::Errors::Client)
        expect(response.failure?).to be(true)
        expect(response.failure.status.forbidden?).to be(true)
      end
    end
  end

end