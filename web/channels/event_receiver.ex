require IEx
defmodule Wavelength.EventReceiver do
  require Logger
  def start do
    KafkaEx.create_worker(:streaming_worker)
    for message <- KafkaEx.stream("artsy", 0, worker_name: :streaming_worker), acceptable_message?(message.value) do
      Wavelength.Endpoint.broadcast("artsy", "new", Poison.decode!(message.value))
    end
  end

  def acceptable_message?(message) do
    true
  end
end