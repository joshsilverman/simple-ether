module Etherpad
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def acts_as_pad(options = {})
      cattr_accessor :next_pad_id

      def self.next_pad_id
        response_body = fetch(ETHERPAD_SERVER_PATH + '/ep/pad/newpad').body
        return response_body
      end

      def self.fetch(uri_str, limit = 1)
        raise ArgumentError, 'HTTP redirect too deep' if limit == 0

        response = Net::HTTP.get_response(URI.parse(uri_str))
        case response
        when Net::HTTPSuccess     then response
        when Net::HTTPRedirection then fetch(response['location'], limit - 1)
        else
          response.error!
        end
      end
    end
  end
end

ActiveRecord::Base.send :include, Etherpad