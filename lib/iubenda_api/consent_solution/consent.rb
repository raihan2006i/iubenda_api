module IubendaApi # :nodoc:
  module ConsentSolution # :nodoc:

    # Response serializer class for client service IubendaApi::ConsentSolution::Clients::Consent
    #
    class Consent < ApiStruct::Entity

      # @!method self.show(id)
      #   Gets a consent
      #   @param id [String] the id of the consent
      #   @return [IubendaApi::ConsentSolution::Consent] if found
      #   @return [ApiStruct::Errors::Entity] if not found or failed
      #   @example
      #     IubendaApi::ConsentSolution::Consent.show('00b654b3-ce4d-45c9-a8aa-9450551579c0') # -> #<IubendaApi::ConsentSolution::Consent id="00b654b3-ce4d-45c9-a8aa-9450551579c0", ...>
      #     IubendaApi::ConsentSolution::Consent.show('notfound') # -> #<ApiStruct::Errors::Entity body=#<Hashie::Mash message="Invalid authentication credentials"> error=true status=#<HTTP::Response::Status 403 Forbidden>>
      #   @see IubendaApi::ConsentSolution::Clients::Consent#show
      #
      #

      # @!method self.list(options = {})
      #   Gets list of subjects
      #   @overload list
      #   @overload list(options)
      #     @param [Hash] options options to send as query parameters. Options are same as IubendaApi::ConsentSolution::Clients::Consent#list options
      #     @see IubendaApi::ConsentSolution::Clients::Consent#list
      #   @return [Array<IubendaApi::ConsentSolution::Consent>] if success
      #   @return [ApiStruct::Errors::Entity] if failed
      #   @example
      #     IubendaApi::ConsentSolution::Consent.list(limit: 1) # -> [#<IubendaApi::ConsentSolution::Consent id="00b654b3-ce4d-45c9-a8aa-9450551579c0", ...>, ...]
      #     IubendaApi::ConsentSolution::Consent.list(limit: 1) # -> #<ApiStruct::Errors::Entity body=#<Hashie::Mash message="Invalid authentication credentials"> error=true status=#<HTTP::Response::Status 403 Forbidden>>
      #

      # @!method self.create(options)
      #   Creates a consent
      #
      #   @param [Hash] options options to send as consent attributes. Options are same as IubendaApi::ConsentSolution::Clients::Consent#create options
      #   @see IubendaApi::ConsentSolution::Clients::Consent#create
      #   @return [IubendaApi::ConsentSolution::Consent] if created
      #   @return [ApiStruct::Errors::Entity] if not found or failed
      #   @example
      #     IubendaApi::ConsentSolution::Consent.create(
      #       subject: {
      #         id: 'testsubject',
      #         email: 'subject@example.com',
      #         first_name: "John",
      #         last_name: "Doe",
      #         verified: false
      #       },
      #       preferences: {
      #         newsletter: false,
      #         privacy_policy: true
      #       }
      #     ) # -> #<IubendaApi::ConsentSolution::Consent id="00b654b3-ce4d-45c9-a8aa-9450551579c0" timestamp="2019-11-05T11:33:20.039Z">
      #     IubendaApi::ConsentSolution::Consent.create({}) # -> #<ApiStruct::Errors::Entity body=#<Hashie::Mash message="Invalid authentication credentials"> error=true status=#<HTTP::Response::Status 403 Forbidden>>
      #
      #
      client_service IubendaApi::ConsentSolution::Clients::Consent

      # @!attribute [r] id
      #   @return [String] Unique identifier of the specific consent event
      #
      # @!attribute [r] timestamp
      #   @return [String] ISO 8601 timestamp at which the consent occurred
      #
      # @!attribute [r] checksum
      #   @return [String]
      #
      # @!attribute [r] owner
      #   @return [String] Unique identifier of the API key owner
      #
      # @!attribute [r] subject
      #   @return [Hash] Subject of the consent
      #
      # @!attribute [r] preferences
      #   @return [Hash] Set of key-value pairs with user preferences for the consent action
      #
      # @!attribute [r] legal_notices
      #   @return [Array<Hash>] Array of objects containing legal_notices data
      #
      # @!attribute [r] proofs
      #   @return [Array<Hash>] Array of objects containing proof data
      #
      # @!attribute [r] ip_address
      #   @return [String] IP address on the Consent
      #
      # @!attribute [r] source
      #   @return [String] Whether the consent was filed from the public or the private API key
      #
      attr_entity :id, :timestamp, :checksum, :owner, :subject, :preferences, :legal_notices, :proofs, :ip_address, :source
    end
  end
end
