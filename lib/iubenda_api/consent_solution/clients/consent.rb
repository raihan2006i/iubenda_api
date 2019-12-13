module IubendaApi # :nodoc:
  module ConsentSolution # :nodoc:
    module Clients # :nodoc:

      # Endpoint wrapper class for Iubenda Consent HTTP APIs
      # @see https://www.iubenda.com/en/help/6484-consent-solution-http-api-documentation#consent-1
      class Consent < ApiStruct::Client
        consent_solution_api :consent

        # Calls GET /consent/:id
        #
        # @param id [String] the id of the consent
        # @return [Dry::Monads::Result::Success] if success
        # @return [Dry::Monads::Result::Failure] if failed
        # @example
        #   IubendaApi::ConsentSolution::Clients::Consent.new.show('testsubject') # -> Dry::Monads::Result::Success({:id=>"testsubject", :email=>"subject@example.com", :first_name=>"John", :last_name=>"Doe", :verified=>false, :owner_id=>"1", :preferences=> {}, :timestamp=>"2019-11-04T17:30:58+00:00"})
        #   IubendaApi::ConsentSolution::Clients::Consent.new.show('notfound') # -> Dry::Monads::Result::Failure(#<ApiStruct::Errors::Client:0x007ff1544606c0 @status=#<HTTP::Response::Status 404 Not Found>, @body={:status=>"not_found"}>)
        # @see https://www.iubenda.com/en/help/6484-consent-solution-http-api-documentation#get-consent
        def show(id)
          get(id)
        end

        # Calls GET /consent
        #
        # @overload list
        # @overload list(options)
        #   @param [Hash] options options to send as query parameters.
        #   @option options [String] :from_time	Filter by consents timestamp. Returns all consents from that time onward (inclusive). Valid formats: 2018-02-22 00:40:00 UTC, 2018-02-22T00:40:00Z (ISO 8601), 1519260000 (unix timestamp in seconds). Default null
        #   @option options [String] :to_time	Filter by consents timestamp. Returns all consents from that time backward (inclusive). Valid formats: 2018-02-22 00:40:00 UTC, 2018-02-22T00:40:00Z (ISO 8601), 1519260000 (unix timestamp in seconds). Default null
        #   @option options [String] :source	Filter by consents source. Possible values: public, private. Default null
        #   @option options [String] :ip_address	Filter by IP address. Default null. Valid formats (IP address format|’none’)
        #   @option options [String] :subject_id	Filter by Subject ID. Default null
        #   @option options [String] :subject_email_exact	Filter by Subject email. It must exactly match (case sensitive). Default null
        #   @option options [String] :subject_email	Filter by Subject email. It tries to match parts of the provided email split by dots and spaces. Ex. providing “@test.com” will match all the subjects with an email containing “@test” or containing “com” (case insensitive). Default null
        #   @option options [String] :subject_first_name	Filter by Subject first name. It must exactly match (case sensitive). Default null
        #   @option options [String] :subject_last_name	Filter by Subject last name. It must exactly match (case sensitive). Default null
        #   @option options [String] :subject_full_name	Filter by Subject full name. It tries to match parts of the provided full name split by dots and spaces. Ex. “test hello” will match all the subjects with a full name containing “test” or containing “hello” (case insensitive). Default null
        #   @option options [String] :subject_verified	Filter by subject verified status. Possible values: true, false. Default null
        #   @option options [String] :preference_key	Filter for consents in which the key exists. Default null
        #   @option options [UUID] :starting_after	Cursor which indicates after which Consent the results should be returned (cursor excluded). Default null
        #   @option options [Numeric] :limit	optional	Integer	Number indicating the number of results returned. Min: 1, Max: 100. Default 10
        # @return [Dry::Monads::Result::Success] if success
        # @return [Dry::Monads::Result::Failure] if failed
        # @example
        #   IubendaApi::ConsentSolution::Clients::Consent.new.list(limit: 1) # -> Dry::Monads::Result::Success([{:id=>"testsubject", :email=>"subject@example.com", :first_name=>"John", :last_name=>"Doe", :verified=>false, :owner_id=>"1", :preferences=> {}, :timestamp=>"2019-11-04T17:30:58+00:00"}])
        #   IubendaApi::ConsentSolution::Clients::Consent.new.list(limit: 1) # -> Dry::Monads::Result::Failure(#<ApiStruct::Errors::Client:0x007f7f699fc3c0 @status=#<HTTP::Response::Status 403 Forbidden>, @body={:message=>"Invalid authentication credentials"}>)
        # @see https://www.iubenda.com/en/help/6484-consent-solution-http-api-documentation#list-consents
        def list(options = {})
          get(params: options)
        end

        # Calls POST /consent
        #
        # @param [Hash] options options to send as subject attributes.
        # @option options [String] :timestamp	ISO 8601 timestamp at which the consent occurred
        # @option options [Hash] :subject
        #   * :id (String) auto-filled if not provided
        #   * :email (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :full_name (String)
        #   * :verified (Boolean) Reserved field used to signal whether a subject is verified, for instance via the double opt-in method
        # @option options [Array<Hash>] :legal_notices	Array of objects containing legal_notices data
        #   * :identifier	(String)	privacy_policy, cookie_policy, terms or a custom identifier
        #   * :version (String) auto-filled if not provided
        # @option options [Array<Hash>] :proofs	Array of objects containing proof data
        #   * :content	(String)
        #   * :form (String)
        # @option options [Hash] :preferences	Set of key-value pairs with user preferences for the consent action
        # @option options [String] :ip_address Considered only when using a `private` key. Saves the passed IP address on the Consent. Default null
        # @option options [String] :autodetect_ip_address	Default `true`, Considered only when using a `public` key. Enables or disables (true, false) the IP address autedetection. Default true
        # @return [Dry::Monads::Result::Success] if success
        # @return [Dry::Monads::Result::Failure] if failed
        # @example
        #   IubendaApi::ConsentSolution::Clients::Consent.new.create(id: 'testsubject', email: 'subject@example.com', first_name: "John", last_name: "Doe", verified: false) # -> Dry::Monads::Result::Success({:id=>"testsubject", :timestamp=>"2019-11-05T11:33:20.039Z"})
        #   IubendaApi::ConsentSolution::Clients::Consent.new.create(id: 'testsubject', email: 'subject@example.com', first_name: "John", last_name: "Doe", verified: false) # -> Dry::Monads::Result::Failure(#<ApiStruct::Errors::Client:0x007f7f699fc3c0 @status=#<HTTP::Response::Status 403 Forbidden>, @body={:message=>"Invalid authentication credentials"}>)
        # @see https://www.iubenda.com/en/help/6484-consent-solution-http-api-documentation#create-consent
        def create(options)
          post(json: options)
        end
      end
    end
  end
end
