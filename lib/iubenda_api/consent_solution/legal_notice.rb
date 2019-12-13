module IubendaApi # :nodoc:
  module ConsentSolution # :nodoc:

    # Response serializer class for client service IubendaApi::ConsentSolution::Clients::LegalNotice
    #
    class LegalNotice < ApiStruct::Entity

      # @!method self.version(identifier, version)
      #   Gets a legal notice version
      #   @param identifier [String] the identifier of the legal notice
      #   @param version [String] the version of the legal notice
      #   @return [IubendaApi::ConsentSolution::LegalNotice] if found
      #   @return [ApiStruct::Errors::Entity] if not found or failed
      #   @example
      #     IubendaApi::ConsentSolution::LegalNotice.version('privacy_policy', 1) # -> #<IubendaApi::ConsentSolution::LegalNotice identifier="privacy_policy" version=1 timestamp="2019-11-07T16:18:05+00:00" content=#<Hashie::Mash>
      #     IubendaApi::ConsentSolution::LegalNotice.version('notfound', 1) # -> #<ApiStruct::Errors::Entity body=#<Hashie::Mash message="Invalid authentication credentials"> error=true status=#<HTTP::Response::Status 403 Forbidden>>
      #   @see IubendaApi::ConsentSolution::Clients::LegalNotice#version
      #

      # @!method self.versions(identifier)
      #   Gets list of versions of a legal notice
      #   @param identifier [String] the identifier of the legal notice
      #   @return [Array<IubendaApi::ConsentSolution::LegalNotice>] if success
      #   @return [ApiStruct::Errors::Entity] if failed
      #   @example
      #     IubendaApi::ConsentSolution::LegalNotice.versions('privacy_policy') # -> [#<IubendaApi::ConsentSolution::LegalNotice identifier="privacy_policy" version=1 timestamp="2019-11-07T16:18:05+00:00" content=#<Hashie::Mash>, ...]
      #     IubendaApi::ConsentSolution::LegalNotice.versions('notfound') # -> #<ApiStruct::Errors::Entity body=#<Hashie::Mash message="Invalid authentication credentials"> error=true status=#<HTTP::Response::Status 403 Forbidden>>
      #   @see IubendaApi::ConsentSolution::Clients::LegalNotice#versions
      #

      # @!method self.list(options = {})
      #   Gets list of legal notices
      #   @overload list
      #   @overload list(options)
      #     @param [Hash] options options to send as query parameters. Options are same as IubendaApi::ConsentSolution::Clients::LegalNotice#list options
      #     @see IubendaApi::ConsentSolution::Clients::LegalNotice#list
      #   @return [Array<IubendaApi::ConsentSolution::LegalNotice>] if success
      #   @return [ApiStruct::Errors::Entity] if failed
      #   @example
      #     IubendaApi::ConsentSolution::LegalNotice.list(limit: 1) # -> [#<IubendaApi::ConsentSolution::LegalNotice content=#<Hashie::Mash it="https://example.com/privacy_policy.pdf"> id="10298_privacy_policy" identifier="privacy_policy" owner_id="1000" timestamp="2019-11-22T14:12:06+00:00" version=1>, ...]
      #     IubendaApi::ConsentSolution::LegalNotice.list(limit: 1) # -> #<ApiStruct::Errors::Entity body=#<Hashie::Mash message="Invalid authentication credentials"> error=true status=#<HTTP::Response::Status 403 Forbidden>>
      #

      # @!method self.create(options)
      #   Creates a legal notice
      #   @param [Hash] options options to send as legal notice attributes. Options are same as IubendaApi::ConsentSolution::Clients::LegalNotice#create options
      #   @see IubendaApi::ConsentSolution::Clients::LegalNotice#create
      #   @return [IubendaApi::ConsentSolution::LegalNotice] if created
      #   @return [ApiStruct::Errors::Entity] if not created or failed
      #   @example
      #     # Without multi-language content:
      #     IubendaApi::ConsentSolution::LegalNotice.create(
      #       identifier: "privacy_policy",
      #       content: "privacy policy content"
      #     ) # -> #<IubendaApi::ConsentSolution::LegalNotice identifier="privacy_policy" version=1 timestamp="2019-12-13T14:56:00Z">
      #
      #     # With multi-language content:
      #     IubendaApi::ConsentSolution::LegalNotice.create(
      #       identifier: "privacy_policy",
      #       content: {
      #         en: "privacy policy content",
      #         it: "contenuto della privacy policy"
      #       }
      #     ) # -> #<IubendaApi::ConsentSolution::LegalNotice identifier="privacy_policy" version=1 timestamp="2019-12-13T14:56:00Z">
      #
      #     # Error
      #     IubendaApi::ConsentSolution::LegalNotice.create(identifier: "privacy_policy", content: "privacy policy content") # -> #<ApiStruct::Errors::Entity body=#<Hashie::Mash message="Invalid authentication credentials"> error=true status=#<HTTP::Response::Status 403 Forbidden>>
      #

      # @!method self.create_multiple(options)
      # @param [Array<Hash>] options Array of legal notice attributes. Options are same as IubendaApi::ConsentSolution::Clients::LegalNotice#create_multiple options
      # @see IubendaApi::ConsentSolution::Clients::LegalNotice#create_multiple
      # @return [Array<IubendaApi::ConsentSolution::LegalNotice>] if success
      # @return [ApiStruct::Errors::Entity] if not created or failed
      # @example
      #   # Multiple legal notice without multi-language content:
      #   IubendaApi::ConsentSolution::LegalNotice.create_multiple([
      #     {
      #       identifier: "privacy_policy",
      #       content: "privacy policy content"
      #     },
      #     {
      #       identifier: "cookie_policy",
      #       content: "cookie policy content"
      #     }
      #   ]) # -> [#<IubendaApi::ConsentSolution::LegalNotice identifier="privacy_policy" version=1 timestamp="2019-12-13T14:56:00Z">, #<IubendaApi::ConsentSolution::LegalNotice identifier="cookie_policy" version=1 timestamp="2019-12-13T14:56:00Z">]
      #
      #   # Multiple legal notice with multi-language content:
      #   IubendaApi::ConsentSolution::LegalNotice.create_multiple([
      #     {
      #       identifier: "privacy_policy",
      #       content: {
      #         en: "privacy policy content",
      #         it: "contenuto della privacy policy"
      #       }
      #     },
      #     {
      #       identifier: "cookie_policy",
      #       content: {
      #         en: "cookie policy content",
      #         it: "contenuto della cookie policy"
      #       }
      #     },
      #   ]) # -> [#<IubendaApi::ConsentSolution::LegalNotice identifier="privacy_policy" version=1 timestamp="2019-12-13T14:56:00Z">, #<IubendaApi::ConsentSolution::LegalNotice identifier="cookie_policy" version=1 timestamp="2019-12-13T14:56:00Z">]
      #
      #   # Error
      #   IubendaApi::ConsentSolution::LegalNotice.create_multiple([identifier: 'privacy_policy', content: 'privacy policy content']) # -> #<ApiStruct::Errors::Entity body=#<Hashie::Mash message="Invalid authentication credentials"> error=true status=#<HTTP::Response::Status 403 Forbidden>>
      #
      client_service IubendaApi::ConsentSolution::Clients::LegalNotice

      # @!attribute [r] id
      #   @return [String] ID of the legal notice
      #
      # @!attribute [r] identifier
      #   @return [String] The identifier of the legal notice
      #
      # @!attribute [r] version
      #   @return [Number] Version of the legal notice
      #
      # @!attribute [r] timestamp
      #   @return [String] ISO 8601 timestamp. Operation time, for instance creation time, update time
      #
      # @!attribute [r] content
      #   @return [String, Hash] Content of the legal notice. Returns hash when content is multi-language, otherwise returns string
      #
      # @!attribute [r] owner_id
      #   @return [String] owner id of the legal notice
      #
      attr_entity :id, :identifier, :version, :timestamp, :content, :owner_id
    end
  end
end
