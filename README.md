# Wavelength

To start Wavelength:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

# Kafka Setup
- Make sure you have created `gravity-changes` topic in kafka.
- Modify following line in `config.exs` to point to proper brokers, 

```elixir
config :kafka_ex,
  brokers: [{"192.168.99.100", 9092}],
  sync_timeout: 1000 #Timeout used synchronous requests from kafka. Defaults to 1000ms.
```
Later we need to change this to get it from env.

# Test
Go to [`localhost:4000`](http://localhost:4000) and make changes or run any spec on Gravity.

# Useful Kafka commands
Can be found [here](https://github.com/artsy/gravity/blob/event-stream/doc/EventStream.md)

## Learn more
* Official website: http://www.phoenixframework.org/
* Guides: http://phoenixframework.org/docs/overview
* Docs: http://hexdocs.pm/phoenix
* Mailing list: http://groups.google.com/group/phoenix-talk
* Source: https://github.com/phoenixframework/phoenix
