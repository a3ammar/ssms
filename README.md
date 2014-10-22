# SSMS

A gem for http://ssms.ws API.


## How to use it

Configure it first with:

```ruby
SSMS.configure do |config|
  config.username = "username"
  config.password = "password"
  config.sender   = "sender"
end
```

Then `sms_client = SSMS::SMS.new`.

## Example

```ruby
sms_client = SSMS::SMS.new
result = sms_client.send(number, message, language) # returns the response by the API.
result.success? # returns true if the message was sent successfully.
sms_client.balance # returns your remaining balance.
```

Please check ssms.ws API [documentation](http://ssms.ws/index.php?action=pages&id=3).


## Notes
Since most Arabic SMS provides use similar APIs you could easy modify this code to
work with your provider.
