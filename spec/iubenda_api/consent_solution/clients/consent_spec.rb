RSpec.describe IubendaApi::ConsentSolution::Clients::Consent do
  let(:client) { IubendaApi::ConsentSolution::Clients::Consent.new }
  let(:id) { 'de801ca9-abec-45e2-8f7c-729822cfffad' }

  describe '#show' do
    let(:response) { client.show(id) }

    context 'api authorized and consent found' do
      before do
        stub_api_request(:get, '/consent/:id', 200, id: id)
      end

      it 'returns a success response' do
        expect(response).to be_a_kind_of(Dry::Monads::Result::Success)
        expect(response.success?).to be(true)
      end

      it 'ensures response has consent object' do
        expect(response.success).to be_a_kind_of(Hash)
        expect(response.success).to have_key(:id)
        expect(response.success).to have_key(:timestamp)
        expect(response.success).to have_key(:checksum)
        expect(response.success).to have_key(:owner)
        expect(response.success).to have_key(:subject)
        expect(response.success[:subject]).to have_key(:id)
        expect(response.success[:subject]).to have_key(:owner_id)
        expect(response.success[:subject]).to have_key(:email)
        expect(response.success[:subject]).to have_key(:first_name)
        expect(response.success[:subject]).to have_key(:last_name)
        expect(response.success[:subject]).to have_key(:verified)
        expect(response.success).to have_key(:preferences)
        expect(response.success[:preferences]).to be_a_kind_of(Hash)
        expect(response.success).to have_key(:legal_notices)
        expect(response.success[:legal_notices]).to be_a_kind_of(Array)
        expect(response.success).to have_key(:proofs)
        expect(response.success[:proofs]).to be_a_kind_of(Array)
        expect(response.success).to have_key(:ip_address)
      end
    end

    context 'api authorized but consent not found' do
      before do
        stub_api_request(:get, '/consent/:id', 404, id: id)
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
        stub_api_request(:get, '/consent/:id', 401, id: id)
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
        stub_api_request(:get, '/consent/:id', 403, id: id)
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
        stub_api_request(:get, '/consent', 200)
      end

      it 'returns a success response' do
        expect(response).to be_a_kind_of(Dry::Monads::Result::Success)
        expect(response.success?).to be(true)
      end

      it 'ensures response has list of consent objects' do
        expect(response.success).to all(be_a_kind_of(Hash))
        expect(response.success).to all(have_key(:id))
        expect(response.success).to all(have_key(:timestamp))
        expect(response.success).to all(have_key(:source))
        expect(response.success).to all(have_key(:owner))
        expect(response.success).to all(have_key(:subject))
        expect(response.success).to all(have_key(:preferences))
        expect(response.success).to all(have_key(:ip_address))
      end
    end

    context 'api unauthorized' do
      before do
        stub_api_request(:get, '/consent', 401)
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
        stub_api_request(:get, '/consent', 403)
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
    let(:response) { client.create(id: id) }

    context 'api authorized' do
      before do
        stub_api_request(:post, '/consent', 200)
      end

      it 'returns a success response' do
        expect(response).to be_a_kind_of(Dry::Monads::Result::Success)
        expect(response.success?).to be(true)
      end

      it 'ensures response has consent object' do
        expect(response.success).to be_a_kind_of(Hash)
        expect(response.success).to have_key(:id)
      end
    end

    context 'api unauthorized' do
      before do
        stub_api_request(:post, '/consent', 401)
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
        stub_api_request(:post, '/consent', 403)
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