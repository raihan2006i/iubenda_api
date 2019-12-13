RSpec.describe IubendaApi::ConsentSolution::Consent do
  let(:entity) { IubendaApi::ConsentSolution::Consent }
  let(:id) { 'de801ca9-abec-45e2-8f7c-729822cfffad' }

  describe '.show' do
    let(:response) { entity.show(id) }

    context 'api authorized and consent found' do
      before do
        stub_api_request(:get, '/consent/:id', 200, id: id)
      end

      it 'returns a consent entity' do
        expect(response).to be_a_kind_of(IubendaApi::ConsentSolution::Consent)
        expect(response).to respond_to(:id)
        expect(response).to respond_to(:timestamp)
        expect(response).to respond_to(:checksum)
        expect(response).to respond_to(:owner)
        expect(response).to respond_to(:subject)
        expect(response.subject).to respond_to(:id)
        expect(response.subject).to respond_to(:owner_id)
        expect(response.subject).to respond_to(:email)
        expect(response.subject).to respond_to(:first_name)
        expect(response.subject).to respond_to(:last_name)
        expect(response.subject).to respond_to(:verified)
        expect(response).to respond_to(:preferences)
        expect(response.preferences).to be_a_kind_of(Hash)
        expect(response).to respond_to(:legal_notices)
        expect(response.legal_notices).to be_a_kind_of(Array)
        expect(response).to respond_to(:proofs)
        expect(response.proofs).to be_a_kind_of(Array)
        expect(response).to respond_to(:ip_address)
      end
    end

    context 'api authorized but consent not found' do
      before do
        stub_api_request(:get, '/consent/:id', 404, id: id)
      end

      it 'returns an error entity with not_found status' do
        expect(response).to be_a_kind_of(ApiStruct::Errors::Entity)
        expect(response.status.not_found?).to be(true)
      end
    end

    context 'api unauthorized' do
      before do
        stub_api_request(:get, '/consent/:id', 401, id: id)
      end

      it 'returns an error entity with unauthorized status' do
        expect(response).to be_a_kind_of(ApiStruct::Errors::Entity)
        expect(response.status.unauthorized?).to be(true)
      end
    end

    context 'api forbidden' do
      before do
        stub_api_request(:get, '/consent/:id', 403, id: id)
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
        stub_api_request(:get, '/consent', 200)
      end

      it 'returns list of consent entities' do
        expect(response).to all(be_a_kind_of(IubendaApi::ConsentSolution::Consent))
        expect(response).to all(respond_to(:id))
        expect(response).to all(respond_to(:timestamp))
        expect(response).to all(respond_to(:source))
        expect(response).to all(respond_to(:owner))
        expect(response).to all(respond_to(:subject))
        expect(response).to all(respond_to(:preferences))
        expect(response).to all(respond_to(:ip_address))
      end
    end

    context 'api unauthorized' do
      before do
        stub_api_request(:get, '/consent', 401)
      end

      it 'returns an error entity with unauthorized status' do
        expect(response).to be_a_kind_of(ApiStruct::Errors::Entity)
        expect(response.status.unauthorized?).to be(true)
      end
    end

    context 'api forbidden' do
      before do
        stub_api_request(:get, '/consent', 403)
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
        stub_api_request(:post, '/consent', 200)
      end

      it 'creates and returns a subject entity' do
        expect(response).to be_a_kind_of(IubendaApi::ConsentSolution::Consent)
        expect(response).to respond_to(:id)
      end
    end

    context 'api unauthorized' do
      before do
        stub_api_request(:post, '/consent', 401)
      end

      it 'returns an error entity with unauthorized status' do
        expect(response).to be_a_kind_of(ApiStruct::Errors::Entity)
        expect(response.status.unauthorized?).to be(true)
      end
    end

    context 'api forbidden' do
      before do
        stub_api_request(:post, '/consent', 403)
      end

      it 'returns an error entity with forbidden status' do
        expect(response).to be_a_kind_of(ApiStruct::Errors::Entity)
        expect(response.status.forbidden?).to be(true)
      end
    end
  end
end