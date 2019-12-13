module IubendaApi # :nodoc:
  module ConsentSolution # :nodoc:
    module Clients # :nodoc:

      # Endpoint wrapper class for Iubenda LegalNotice HTTP APIs
      # @see https://www.iubenda.com/en/help/6484-consent-solution-http-api-documentation#legal-notices
      class LegalNotice < ApiStruct::Client
        consent_solution_api :legal_notices

        # Calls GET /legal_notices/:identifier/:version
        #
        # @param identifier [String] the identifier of the legal notice
        # @param version [String] the version of the legal notice
        # @return [Dry::Monads::Result::Success] if success
        # @return [Dry::Monads::Result::Failure] if failed
        # @example
        #   IubendaApi::ConsentSolution::Clients::LegalNotice.new.version('privacy_policy', '1') # -> Dry::Monads::Result::Success({:identifier=>"privacy_policy", :version=>1, :timestamp=>"2019-11-07T15:26:33+00:00", :content=>{:it=>"http://localhost:3000/privacy_policy.pdf"}})
        #   IubendaApi::ConsentSolution::Clients::LegalNotice.new.version('notfound', '1') # -> Dry::Monads::Result::Failure(#<ApiStruct::Errors::Client:0x007ff1544606c0 @status=#<HTTP::Response::Status 404 Not Found>, @body={:status=>"not_found"}>)
        # @see https://www.iubenda.com/en/help/6484-consent-solution-http-api-documentation#get-a-legal-notice-version
        def version(identifier, version)
          get(path: 'legal_notices/:identifier/:version', identifier: identifier, version: version)
        end

        # Calls GET /legal_notices/:identifier
        #
        # @param identifier [String] the identifier of the legal notice
        # @return [Dry::Monads::Result::Success] if success
        # @return [Dry::Monads::Result::Failure] if failed
        # @example
        #   IubendaApi::ConsentSolution::Clients::LegalNotice.new.versions('privacy_policy') # -> Dry::Monads::Result::Success([{:identifier=>"privacy_policy", :version=>1, :timestamp=>"2019-11-07T15:26:33+00:00", :id=>"10298_privacy_policy", :owner_id=>"10298", :content=>{:it=>"http://localhost:3000/privacy_policy.pdf"}}])
        #   IubendaApi::ConsentSolution::Clients::LegalNotice.new.versions('notfound') # -> Dry::Monads::Result::Failure(#<ApiStruct::Errors::Client:0x007ff1544606c0 @status=#<HTTP::Response::Status 404 Not Found>, @body={:status=>"not_found"}>)
        # @see https://www.iubenda.com/en/help/6484-consent-solution-http-api-documentation#get-all-legal-notice-versions
        def versions(identifier)
          get(path: 'legal_notices/:identifier', identifier: identifier)
        end

        # Calls GET /legal_notices
        #
        # @overload list
        # @overload list(options)
        #   @param [Hash] options options to send as query parameters.
        #   @option options [String] :id Optional, Filter by id. It must exactly match. Default null
        #   @option options [String] :identifier Optional, Filter by identifier. It must exactly match (case sensitive). Default null.
        #   @option options [Numeric] :version Optional, Numeric	Filter by version. It must exactly match. Default null.
        #   @option options [String] :language Optional, Filter by legal notices which contents include the specified language (using short form like ‘en’, ‘it’ etc.). Default null.
        #   @option options [String] :from_time Optional, Filter by legal notices timestamp. Returns all legal notices from that time onward (inclusive). Valid formats: 2018-02-22 00:40:00 UTC, 2018-02-22T00:40:00Z (ISO 8601), 1519260000 (unix timestamp in seconds). Default null.
        #   @option options [String] :to_time Optional, Filter by legal notices timestamp. Returns all legal notices from that time backward (inclusive). Valid formats: 2018-02-22 00:40:00 UTC, 2018-02-22T00:40:00Z (ISO 8601), 1519260000 (unix timestamp in seconds). Default null.
        #   @option options [Numeric] :starting_after_version Optional, Cursor which indicates after which Legal Notice’s version the results should be returned (cursor excluded). Default null.
        #   @option options [String] :starting_after_identifier Optional, Cursor which indicates after which Legal Notice’s identifier the results should be returned (cursor excluded). Default null.
        #   @option options [Numeric] :limit Optional, Number indicating the number of results returned. Min: 1, Max: 100. Default 10.
        # @return [Dry::Monads::Result::Success] if success
        # @return [Dry::Monads::Result::Failure] if failed
        # @example
        #   IubendaApi::ConsentSolution::Clients::LegalNotice.new.list(limit: 1) # -> Dry::Monads::Result::Success([{:identifier=>"privacy_policy", :version=>1, :timestamp=>"2019-11-07T15:26:33+00:00", :id=>"10298_privacy_policy", :owner_id=>"10298", :content=>{:it=>"http://localhost:3000/privacy_policy.pdf"}}])
        #   IubendaApi::ConsentSolution::Clients::LegalNotice.new.list(limit: 1) # -> Dry::Monads::Result::Failure(#<ApiStruct::Errors::Client:0x007f7f699fc3c0 @status=#<HTTP::Response::Status 403 Forbidden>, @body={:message=>"Invalid authentication credentials"}>)
        # @see https://www.iubenda.com/en/help/6484-consent-solution-http-api-documentation#list-legal-notices
        def list(options = {})
          get(params: options)
        end

        # Calls POST /legal_notices
        #
        # @param [Hash] options options to send as legal notice attributes.
        # @option options [String] :identifier Identifier of the legal notice
        # @option options [String] :timestamp	ISO 8601 timestamp at operation
        # @option options [String, Hash] :content Content of the legal notice
        # @return [Dry::Monads::Result::Success] if success
        # @return [Dry::Monads::Result::Failure] if failed
        # @example
        #   # Without multi-language content:
        #   IubendaApi::ConsentSolution::Clients::LegalNotice.new.create(
        #     identifier: "privacy_policy",
        #     content: "privacy policy content"
        #   ) # -> Dry::Monads::Result::Success({:identifier=>"privacy_policy", :version=>1, :timestamp=>"2018-05-16T13:55:57"})
        #
        #   # With multi-language content:
        #   IubendaApi::ConsentSolution::Clients::LegalNotice.new.create(
        #     identifier: "privacy_policy",
        #     content: {
        #       en: "privacy policy content",
        #       it: "contenuto della privacy policy"
        #     }
        #   ) # -> Dry::Monads::Result::Success({:identifier=>"privacy_policy", :version=>1, :timestamp=>"2018-05-16T13:55:57"})
        #
        #   # Error
        #   IubendaApi::ConsentSolution::Clients::LegalNotice.new.create(identifier: 'privacy_policy', content: 'privacy policy content') # -> Dry::Monads::Result::Failure(#<ApiStruct::Errors::Client:0x007f7f699fc3c0 @status=#<HTTP::Response::Status 403 Forbidden>, @body={:message=>"Invalid authentication credentials"}>)
        # @see https://www.iubenda.com/en/help/6484-consent-solution-http-api-documentation#create-a-legal-notice
        def create(options)
          post(json: options)
        end

        # Calls POST /legal_notices
        #
        # @param [Array<Hash>] options Array of legal notice attributes
        #   * :identifier (String) Identifier of the legal notice
        #   * :timestamp (String)	ISO 8601 timestamp at operation
        #   * :content (String, Hash) Content of the legal notice
        # @return [Dry::Monads::Result::Success] if success
        # @return [Dry::Monads::Result::Failure] if failed
        # @example
        #   # Without multi-language content:
        #   IubendaApi::ConsentSolution::Clients::LegalNotice.new.create_multiple([
        #     identifier: "privacy_policy",
        #     content: "privacy policy content"
        #   ]) # -> Dry::Monads::Result::Success([{:identifier=>"privacy_policy", :version=>1, :timestamp=>"2018-05-16T13:55:57"}])
        #
        #   # With multi-language content:
        #   IubendaApi::ConsentSolution::Clients::LegalNotice.new.create_multiple([
        #     identifier: "privacy_policy",
        #     content: {
        #       en: "privacy policy content",
        #       it: "contenuto della privacy policy"
        #     }
        #   ]) # -> Dry::Monads::Result::Success([{:identifier=>"privacy_policy", :version=>1, :timestamp=>"2018-05-16T13:55:57"}])
        #
        #   # Error
        #   IubendaApi::ConsentSolution::Clients::LegalNotice.new.create_multiple([identifier: 'privacy_policy', content: 'privacy policy content']) # -> Dry::Monads::Result::Failure(#<ApiStruct::Errors::Client:0x007f7f699fc3c0 @status=#<HTTP::Response::Status 403 Forbidden>, @body={:message=>"Invalid authentication credentials"}>)
        # @see https://www.iubenda.com/en/help/6484-consent-solution-http-api-documentation#create-multiple-legal-notices
        def create_multiple(options)
          post(json: options)
        end
      end
    end
  end
end
