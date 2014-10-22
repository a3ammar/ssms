require "ssms/version"
require 'httparty'

module SSMS
  class << self
    attr_accessor :configuration
    # This stores the configuration objects for access later
  end

  class Configuration
    # This class defines the configuration structure which will be saved in the class
    # instance
    attr_accessor :username, :password, :sender

    def initialize
      @username = "demo"
      @password = "demo"
      @sender	= "smss.ws"
    end
  end

  class SMS
    def send(numbers, message, lang)
      numbers = numbers.join(',') if numbers.respond_to?(:join) # is it array?
      message = URI::encode(message) # need to encoding the message

      url = "http://ssms.ws/sendsms.php?" +
            "user=#{SSMS.configuration.username}&" +
            "password=#{SSMS.configuration.password}&" +
            "numbers=#{numbers}&" +
            "sender=#{SSMS.configuration.sender}&" +
            "message=#{message}&" +
            "lang=#{lang}"

      @response = HTTParty.get(url)
      if @response.code == 200
        @response
      else
        "Network Error"
      end
    end

    def balance
      url = "http://ssms.ws/sendsms.php?" +
            "user=#{SSMS.configuration.username}&" +
            "password=#{SSMS.configuration.password}&" +
            "action=get"
      HTTParty.get(url).to_f
    end

    def success?
      if @response =~ /:/
        @response.split(',').map { |i| i.split(':') }.each do |number|
          if number[0] == "1"
            next
          else
            return false
          end
        end
        return true
      end
    end
  end

  def self.configure
    # This defines the SMS.configure method. If there are no configuration stored in
    # the instance create a new configuration and yeild that object so we may
    # configurate it in a block, like so:

    # SSMS.configure do |conf|
    #   conf.username = "foo"
    #   conf.password = "bar"
    #   conf.sender   =  "foobar"
    # end

    self.configuration ||= Configuration.new
    yield(configuration)
  end

end
