RSpec.describe IubendaApi::ConsentSolution::Clients::Subject do
  let(:client) { IubendaApi::ConsentSolution::Clients::Subject.new }
  let(:id) { 'testsubject' }

  describe '#show' do
    let(:response) { client.show(id) }

    context 'api authorized and subject found' do
      before do
        stub_api_request(:get, '/subjects/:id', 200, id: id)
      end

      it 'returns a success response' do
        expect(response).to be_a_kind_of(Dry::Monads::Result::Success)
        expect(response.success?).to be(true)
      end

      it 'ensures response has subject object' do
        expect(response.success).to be_a_kind_of(Hash)
        expect(response.success).to have_key(:id)
        expect(response.success).to have_key(:owner_id)
        expect(response.success).to have_key(:email)
        expect(response.success).to have_key(:first_name)
        expect(response.success).to have_key(:last_name)
        expect(response.success).to have_key(:verified)
        expect(response.success).to have_key(:preferences)
        expect(response.success).to have_key(:timestamp)
      end
    end

    context 'api authorized but subject not found' do
      before do
        stub_api_request(:get, '/subjects/:id', 404, id: id)
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
        stub_api_request(:get, '/subjects/:id', 401, id: id)
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
        stub_api_request(:get, '/subjects/:id', 403, id: id)
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
        stub_api_request(:get, '/subjects', 200)
      end

      it 'returns a success response' do
        expect(response).to be_a_kind_of(Dry::Monads::Result::Success)
        expect(response.success?).to be(true)
      end

      it 'ensures response has list of subject objects' do
        expect(response.success).to all(be_a_kind_of(Hash))
        expect(response.success).to all(have_key(:id))
        expect(response.success).to all(have_key(:owner_id))
        expect(response.success).to all(have_key(:email))
        expect(response.success).to all(have_key(:first_name))
        expect(response.success).to all(have_key(:last_name))
        expect(response.success).to all(have_key(:verified))
        expect(response.success).to all(have_key(:preferences))
        expect(response.success).to all(have_key(:timestamp))
      end
    end

    context 'api unauthorized' do
      before do
        stub_api_request(:get, '/subjects', 401)
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
        stub_api_request(:get, '/subjects', 403)
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
        stub_api_request(:post, '/subjects', 200)
      end

      it 'returns a success response' do
        expect(response).to be_a_kind_of(Dry::Monads::Result::Success)
        expect(response.success?).to be(true)
      end

      it 'ensures response has subject object' do
        stub_request(:post, "https://consent.iubenda.com/subjects").
          to_return(status: 200, body: file_fixture('consent_solution/subjects/create.json'))

        expect(response.success).to be_a_kind_of(Hash)
        expect(response.success).to have_key(:id)
      end
    end

    context 'api unauthorized' do
      before do
        stub_api_request(:post, '/subjects', 401)
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
        stub_api_request(:post, '/subjects', 403)
      end

      it 'returns a failure response with forbidden status' do
        expect(response).to be_a_kind_of(Dry::Monads::Result::Failure)
        expect(response.failure).to be_a_kind_of(ApiStruct::Errors::Client)
        expect(response.failure?).to be(true)
        expect(response.failure.status.forbidden?).to be(true)
      end
    end
  end

  describe '#update' do
    let(:response) { client.update(id, email: "john.snow@example.com") }

    context 'api authorized and subject found' do
      it 'returns a success response' do
        stub_request(:put, "https://consent.iubenda.com/subjects/#{id}").
          to_return(status: 200, body: file_fixture('consent_solution/subjects/update.json'))

        expect(response).to be_a_kind_of(Dry::Monads::Result::Success)
        expect(response.success?).to be(true)
      end

      it 'ensures response has subject object' do
        stub_request(:put, "https://consent.iubenda.com/subjects/#{id}").
          to_return(status: 200, body: file_fixture('consent_solution/subjects/update.json'))

        expect(response.success).to be_a_kind_of(Hash)
        expect(response.success).to have_key(:id)
      end
    end

    context 'api authorized but subject not found' do
      it 'returns a failure response with not_found status' do
        stub_request(:put, "https://consent.iubenda.com/subjects/#{id}").
          to_return(status: 404, body: file_fixture('consent_solution/404.json'))

        expect(response).to be_a_kind_of(Dry::Monads::Result::Failure)
        expect(response.failure).to be_a_kind_of(ApiStruct::Errors::Client)
        expect(response.failure?).to be(true)
        expect(response.failure.status.not_found?).to be(true)
      end
    end

    context 'api unauthorized' do
      before do
        stub_request(:put, "https://consent.iubenda.com/subjects/#{id}").
          to_return(status: 401, body: file_fixture('consent_solution/401.json'))
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
        stub_request(:put, "https://consent.iubenda.com/subjects/#{id}").
          to_return(status: 403, body: file_fixture('consent_solution/403.json'))
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