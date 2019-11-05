RSpec.describe IubendaApi::ConsentSolution::Subject do
  let(:entity) { IubendaApi::ConsentSolution::Subject }
  let(:id) { 'testsubject' }

  describe '.show' do
    let(:response) { entity.show(id) }

    context 'api authorized and subject found' do
      before do
        stub_api_request(:get, '/subjects/:id', 200, id: id)
      end

      it 'returns a subject entity' do
        expect(response).to be_a_kind_of(IubendaApi::ConsentSolution::Subject)
        expect(response).to respond_to(:id)
        expect(response).to respond_to(:owner_id)
        expect(response).to respond_to(:email)
        expect(response).to respond_to(:first_name)
        expect(response).to respond_to(:last_name)
        expect(response).to respond_to(:verified)
        expect(response).to respond_to(:preferences)
        expect(response).to respond_to(:timestamp)
      end
    end

    context 'api authorized but subject not found' do
      before do
        stub_api_request(:get, '/subjects/:id', 404, id: id)
      end

      it 'returns an error entity with not_found status' do
        expect(response).to be_a_kind_of(ApiStruct::Errors::Entity)
        expect(response.status.not_found?).to be(true)
      end
    end

    context 'api unauthorized' do
      before do
        stub_api_request(:get, '/subjects/:id', 401, id: id)
      end

      it 'returns an error entity with unauthorized status' do
        expect(response).to be_a_kind_of(ApiStruct::Errors::Entity)
        expect(response.status.unauthorized?).to be(true)
      end
    end

    context 'api forbidden' do
      before do
        stub_api_request(:get, '/subjects/:id', 403, id: id)
      end

      it 'returns an error entity with forbidden status' do
        expect(response).to be_a_kind_of(ApiStruct::Errors::Entity)
        expect(response.status.forbidden?).to be(true)
      end
    end
  end

  describe '.list' do
    let(:response) { entity.list }

    context 'api authorized' do
      before do
        stub_api_request(:get, '/subjects', 200)
      end

      it 'returns list of subject entities' do
        expect(response).to all(be_a_kind_of(IubendaApi::ConsentSolution::Subject))
        expect(response).to all(respond_to(:id))
        expect(response).to all(respond_to(:owner_id))
        expect(response).to all(respond_to(:email))
        expect(response).to all(respond_to(:first_name))
        expect(response).to all(respond_to(:last_name))
        expect(response).to all(respond_to(:verified))
        expect(response).to all(respond_to(:preferences))
        expect(response).to all(respond_to(:timestamp))
      end
    end

    context 'api unauthorized' do
      before do
        stub_api_request(:get, '/subjects', 401)
      end

      it 'returns an error entity with unauthorized status' do
        expect(response).to be_a_kind_of(ApiStruct::Errors::Entity)
        expect(response.status.unauthorized?).to be(true)
      end
    end

    context 'api forbidden' do
      before do
        stub_api_request(:get, '/subjects', 403)
      end

      it 'returns an error entity with forbidden status' do
        expect(response).to be_a_kind_of(ApiStruct::Errors::Entity)
        expect(response.status.forbidden?).to be(true)
      end
    end
  end

  describe '.create' do
    let(:response) { entity.create(id: id) }

    context 'api authorized' do
      before do
        stub_api_request(:post, '/subjects', 200)
      end

      it 'creates and returns a subject entity' do
        expect(response).to be_a_kind_of(IubendaApi::ConsentSolution::Subject)
        expect(response).to respond_to(:id)
      end
    end

    context 'api unauthorized' do
      before do
        stub_api_request(:post, '/subjects', 401)
      end

      it 'returns an error entity with unauthorized status' do
        expect(response).to be_a_kind_of(ApiStruct::Errors::Entity)
        expect(response.status.unauthorized?).to be(true)
      end
    end

    context 'api forbidden' do
      before do
        stub_api_request(:post, '/subjects', 403)
      end

      it 'returns an error entity with forbidden status' do
        expect(response).to be_a_kind_of(ApiStruct::Errors::Entity)
        expect(response.status.forbidden?).to be(true)
      end
    end
  end

  describe '.update' do
    let(:response) { entity.update(id, email: "john.snow@example.com") }

    context 'api authorized and subject found' do
      before do
        stub_api_request(:put, '/subjects/:id', 200, id: id)
      end

      it 'updates and returns a subject entity' do
        expect(response).to be_a_kind_of(IubendaApi::ConsentSolution::Subject)
        expect(response).to respond_to(:id)
      end
    end

    context 'api authorized but subject not found' do
      before do
        stub_api_request(:put, '/subjects/:id', 404, id: id)
      end

      it 'returns an error entity with not_found status' do
        expect(response).to be_a_kind_of(ApiStruct::Errors::Entity)
        expect(response.status.not_found?).to be(true)
      end
    end

    context 'api unauthorized' do
      before do
        stub_api_request(:put, '/subjects/:id', 401, id: id)
      end

      it 'returns an error entity with unauthorized status' do
        expect(response).to be_a_kind_of(ApiStruct::Errors::Entity)
        expect(response.status.unauthorized?).to be(true)
      end
    end

    context 'api forbidden' do
      before do
        stub_api_request(:put, '/subjects/:id', 403, id: id)
      end

      it 'returns an error entity with forbidden status' do
        expect(response).to be_a_kind_of(ApiStruct::Errors::Entity)
        expect(response.status.forbidden?).to be(true)
      end
    end
  end
end