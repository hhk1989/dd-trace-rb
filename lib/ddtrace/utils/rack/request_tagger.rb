require 'ddtrace/utils/base_tagger'

module Datadog
  module Utils
    module Rack
      # Tag headers from Rack requests
      class RequestTagger < Datadog::Utils::BaseTagger
        include Singleton

        def name(header)
          Datadog::Ext::HTTP::RequestHeaders.to_tag(header)
        end

        def value(header, env)
          rack_header = "HTTP_#{header.to_s.upcase.gsub(/[-\s]/, '_')}"

          env[rack_header]
        end
      end
    end
  end
end
