module IubendaApi # :nodoc:
  module ConsentSolution # :nodoc:
    module Clients # :nodoc:

      # Endpoint wrapper class for Iubenda Subject HTTP APIs
      # @see https://www.iubenda.com/en/help/6484-consent-solution-http-api-documentation#subjects-1
      class Subject < ApiStruct::Client
        consent_solution_api :subjects

        # Calls GET /subjects/:id
        #
        # @param id [String] the id of the subject
        # @return [Dry::Monads::Result::Success] if success
        # @return [Dry::Monads::Result::Failure] if failed
        # @example
        #   IubendaApi::ConsentSolution::Clients::Subject.new.show('testsubject') # -> Dry::Monads::Result::Success({:id=>"testsubject", :email=>"subject@example.com", :first_name=>"John", :last_name=>"Doe", :verified=>false, :owner_id=>"1", :preferences=> {}, :timestamp=>"2019-11-04T17:30:58+00:00"})
        #   IubendaApi::ConsentSolution::Clients::Subject.new.show('notfound') # -> Dry::Monads::Result::Failure(#<ApiStruct::Errors::Client:0x007ff1544606c0 @status=#<HTTP::Response::Status 404 Not Found>, @body={:status=>"not_found"}>)
        # @see https://www.iubenda.com/en/help/6484-consent-solution-http-api-documentation#get-subjects
        def show(id)
          get(id)
        end

        # Calls GET /subjects
        #
        # @overload list
        # @overload list(options)
        #   @param [Hash] options options to send as query parameters.
        #   @option options [String] :id Filter by id. It must exactly match. Default null
        #   @option options [String] :email_exact Filter by email. It must exactly match. (Case sensitive)
        #   @option options [String] :email Filter by email. It tries to match parts of the provided email split by dots and spaces. Ex. providing “@test.com” will match all the subjects with an email containing “@test” or containing “com” (case insensitive).
        #   @option options [String] :first_name Filter by first name. It must exactly match (case sensitive).
        #   @option options [String] :last_name	Filter by last name. It must exactly match (case sensitive).
        #   @option options [String] :full_name	Filter by full name. It tries to match parts of the provided full name split by dots and spaces. Ex. “test hello” will match all the subjects with a full name containing “test” or containing “hello” (case insensitive).
        #   @option options [String] :from_time	Filter by subjects timestamp. Returns all subjects from that time onward (inclusive). Valid formats: 2018-02-22 00:40:00 UTC, 2018-02-22T00:40:00Z (ISO 8601), 1519260000 (unix timestamp in seconds).
        #   @option options [String] :to_time	Filter by subjects timestamp. Returns all subjects from that time backward (inclusive). Valid formats: 2018-02-22 00:40:00 UTC, 2018-02-22T00:40:00Z (ISO 8601), 1519260000 (unix timestamp in seconds).
        #   @option options [Boolean] :verified	Filter by verified status. Possible values: true, false.
        #   @option options [String] :fulltext Filters for results with the value provided being contained in either id, first_name, last_name, full_name, email.
        #   @option options [String] :starting_after Cursor which indicates after which Subject the results should be returned (cursor excluded).
        #   @option options [Numeric] :limit Number indicating the number of results returned. Min: 1, Max: 100.
        # @return [Dry::Monads::Result::Success] if success
        # @return [Dry::Monads::Result::Failure] if failed
        # @example
        #   IubendaApi::ConsentSolution::Clients::Subject.new.list(limit: 1) # -> Dry::Monads::Result::Success([{:id=>"testsubject", :email=>"subject@example.com", :first_name=>"John", :last_name=>"Doe", :verified=>false, :owner_id=>"1", :preferences=> {}, :timestamp=>"2019-11-04T17:30:58+00:00"}])
        #   IubendaApi::ConsentSolution::Clients::Subject.new.list(limit: 1) # -> Dry::Monads::Result::Failure(#<ApiStruct::Errors::Client:0x007f7f699fc3c0 @status=#<HTTP::Response::Status 403 Forbidden>, @body={:message=>"Invalid authentication credentials"}>)
        # @see https://www.iubenda.com/en/help/6484-consent-solution-http-api-documentation#list-subjects
        def list(options = {})
          get(params: options)
        end

        # Calls POST /subjects
        #
        # @param [Hash] options options to send as subject attributes.
        # @option options [String] :id	auto-filled if not provided
        # @option options [String] :email	Optional
        # @option options [String] :first_name Optional
        # @option options [String] :last_name	Optional
        # @option options [String] :full_name	Optional
        # @option options [Boolean] :verified	Optional, Reserved field used to signal whether a subject is verified, for instance via the double opt-in method
        # @return [Dry::Monads::Result::Success] if success
        # @return [Dry::Monads::Result::Failure] if failed
        # @example
        #   IubendaApi::ConsentSolution::Clients::Subject.new.create(id: 'testsubject', email: 'subject@example.com', first_name: "John", last_name: "Doe", verified: false) # -> Dry::Monads::Result::Success({:id=>"testsubject", :timestamp=>"2019-11-05T11:33:20.039Z"})
        #   IubendaApi::ConsentSolution::Clients::Subject.new.create(id: 'testsubject', email: 'subject@example.com', first_name: "John", last_name: "Doe", verified: false) # -> Dry::Monads::Result::Failure(#<ApiStruct::Errors::Client:0x007f7f699fc3c0 @status=#<HTTP::Response::Status 403 Forbidden>, @body={:message=>"Invalid authentication credentials"}>)
        # @see https://www.iubenda.com/en/help/6484-consent-solution-http-api-documentation#create-subjects
        def create(options)
          post(json: options)
        end

        # Calls PUT /subjects/:id
        #
        # @param [Hash] options options to send as subject attributes.
        # @option options [String] :email	Optional
        # @option options [String] :first_name Optional
        # @option options [String] :last_name	Optional
        # @option options [String] :full_name	Optional
        # @option options [Boolean] :verified	Optional, Reserved field used to signal whether a subject is verified, for instance via the double opt-in method
        # @return [Dry::Monads::Result::Success] if success
        # @return [Dry::Monads::Result::Failure] if failed
        # @example
        #   IubendaApi::ConsentSolution::Clients::Subject.new.update('testsubject', email: 'john.doe@example.com') # -> Dry::Monads::Result::Success({:id=>"testsubject", :timestamp=>"2019-11-05T11:33:20.000+00:00"})
        #   IubendaApi::ConsentSolution::Clients::Subject.new.update('testsubject', email: 'john.doe@example.com') # -> Dry::Monads::Result::Failure(#<ApiStruct::Errors::Client:0x007f7f699fc3c0 @status=#<HTTP::Response::Status 403 Forbidden>, @body={:message=>"Invalid authentication credentials"}>)
        # @see https://www.iubenda.com/en/help/6484-consent-solution-http-api-documentation#update-subjects
        def update(id, options)
          put(id, json: options)
        end
      end
    end
  end
end
