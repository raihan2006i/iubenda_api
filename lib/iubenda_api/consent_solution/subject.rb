module IubendaApi # :nodoc:
  module ConsentSolution # :nodoc:

    # Response serializer class for client service IubendaApi::ConsentSolution::Clients::Subject
    #
    class Subject < ApiStruct::Entity

      # @!method self.show(id)
      #   Gets a subject
      #   @param id [String] the id of the subject
      #   @return [IubendaApi::ConsentSolution::Subject] if found
      #   @return [ApiStruct::Errors::Entity] if not found or failed
      #   @example
      #     IubendaApi::ConsentSolution::Subject.get('testsubject') # -> #<IubendaApi::ConsentSolution::Subject email="john.doe@example.com" first_name="John" full_name=nil id="testsubject" last_name="Doe" owner_id="10240" preferences=nil timestamp="2019-11-05T11:33:20+00:00" verified=false>
      #     IubendaApi::ConsentSolution::Subject.get('notfound') # -> #<ApiStruct::Errors::Entity body=#<Hashie::Mash message="Invalid authentication credentials"> error=true status=#<HTTP::Response::Status 403 Forbidden>>
      #   @see IubendaApi::ConsentSolution::Clients::Subject#show
      #
      #

      # @!method self.list(options = {})
      #   Gets list of subjects
      #   @overload list
      #   @overload list(options)
      #     @param [Hash] options options to send as query parameters.
      #     @see IubendaApi::ConsentSolution::Clients::Subject#list Options are same as IubendaApi::ConsentSolution::Clients::Subject#list options
      #   @return [Array<IubendaApi::ConsentSolution::Subject>] if success
      #   @return [ApiStruct::Errors::Entity] if failed
      #   @example
      #     IubendaApi::ConsentSolution::Subject.list(limit: 1) # -> [#<IubendaApi::ConsentSolution::Subject email="john.doe@example.com" first_name="John" full_name=nil id="testsubject" last_name="Doe" owner_id="10240" preferences=nil timestamp="2019-11-05T11:33:20+00:00" verified=false>, ...]
      #     IubendaApi::ConsentSolution::Subject.list(limit: 1) # -> #<ApiStruct::Errors::Entity body=#<Hashie::Mash message="Invalid authentication credentials"> error=true status=#<HTTP::Response::Status 403 Forbidden>>
      #

      # @!method self.create(options)
      #   Creates a subject
      #   @param [Hash] options options to send as subject attributes. Options are same as IubendaApi::ConsentSolution::Clients::Subject#create options
      #   @see IubendaApi::ConsentSolution::Clients::Subject#create
      #   @return [IubendaApi::ConsentSolution::Subject] if created
      #   @return [ApiStruct::Errors::Entity] if not found or failed
      #   @example
      #     IubendaApi::ConsentSolution::Subject.create(id: 'testsubject', email: 'subject@example.com', first_name: "John", last_name: "Doe", verified: false) # -> #<IubendaApi::ConsentSolution::Subject id="testsubject" timestamp="2019-11-05T11:33:20.039Z">
      #     IubendaApi::ConsentSolution::Subject.create(id: 'testsubject', email: 'subject@example.com', first_name: "John", last_name: "Doe", verified: false) # -> #<ApiStruct::Errors::Entity body=#<Hashie::Mash message="Invalid authentication credentials"> error=true status=#<HTTP::Response::Status 403 Forbidden>>
      #

      # @!method self.update(id, options)
      #   Updates a subject
      #   @param [Hash] options options to send as subject attributes. Options are same as IubendaApi::ConsentSolution::Clients::Subject#update options
      #   @see IubendaApi::ConsentSolution::Clients::Subject#update
      #   @return [IubendaApi::ConsentSolution::Subject] if updated
      #   @return [ApiStruct::Errors::Entity] if not found or failed
      #   @example
      #     IubendaApi::ConsentSolution::Subject.update('testsubject', email: 'subject@example.com') # -> #<IubendaApi::ConsentSolution::Subject id="testsubject" timestamp="2019-11-05T11:33:20.039Z">
      #     IubendaApi::ConsentSolution::Subject.update('testsubject', email: 'subject@example.com') # -> #<ApiStruct::Errors::Entity body=#<Hashie::Mash message="Invalid authentication credentials"> error=true status=#<HTTP::Response::Status 403 Forbidden>>
      #
      client_service IubendaApi::ConsentSolution::Clients::Subject

      # @!attribute [r] id
      #   @return [String] ID of the subject
      #
      # @!attribute [r] email
      #   @return [String] Email of the subject
      #
      # @!attribute [r] first_name
      #   @return [String] First name of the subject
      #
      # @!attribute [r] last_name
      #   @return [String] Last name of the subject
      #
      # @!attribute [r] full_name
      #   @return [String] Full name of the subject
      #
      # @!attribute [r] verified
      #   @return [Boolean] Reserved field used to signal whether a subject is verified, for instance via the double opt-in method
      #
      # @!attribute [r] preferences
      #   @return [Hash] Set of key-value pairs with user preferences for the consent action
      #
      # @!attribute [r] timestamp
      #   @return [String] ISO 8601 timestamp. Operation time, for instance creation time, update time
      #
      # @!attribute [r] owner_id
      #   @return [String] owner id of the subject
      #
      attr_entity :id, :owner_id, :email, :first_name, :last_name, :full_name, :verified, :preferences, :timestamp
    end
  end
end
