require IEx

defmodule Wavelength.EventReceiver do
  require Logger
  def start_link do
    KafkaEx.create_worker(:streaming_worker)
    for message <- KafkaEx.stream("gravity-changes", 1, worker_name: :streaming_worker), acceptable_message?(message.value) do
      proccessed_message = process_message message
      Wavelength.Endpoint.broadcast("artsy", "new", proccessed_message)
    end
  end

  def acceptable_message?(message) do
    try do
      message = Poison.decode!(message)
      IO.inspect message["attributes"]
      is_map(message["attributes"])
    rescue
      Poison.SyntaxError -> false
    end
  end

  def process_message(message) do
    message = Poison.decode!(message.value)
    action = message["attributes"]["action"]
    type = message["attributes"]["type"]
    display = message["attributes"]["display"]
    id = message["attributes"]["key"]
    modifier = message["attributes"]["modifier"]
    modifier_display = message["attributes"]["modifier_display"]
    %{action: action, type: type, id: id, display: display, modifier: modifier, modifier_display: modifier_display}
  end
end