require IEx

defmodule Wavelength.EventReceiver do
  require Logger
  def start_link do
    KafkaEx.create_worker(:streaming_worker)
    for message <- KafkaEx.stream("subscriptions-test", 0, worker_name: :streaming_worker), acceptable_message?(message.value) do
      proccessed_message = process_message message
      Wavelength.Endpoint.broadcast("artsy", "new", proccessed_message)
    end
  end

  def acceptable_message?(message) do
    try do
      Poison.decode!(message)
        |> is_map
    rescue
      Poison.SyntaxError -> false
    end
  end

  def process_message(message) do
    Poison.decode!(message.value)
      |> Map.take(["verb", "subject", "object", "properties"])
  end
end