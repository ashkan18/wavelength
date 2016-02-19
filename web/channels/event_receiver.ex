defmodule Wavelength.EventReceiver do
  def start do
    KafkaEx.create_worker(:streaming_worker)
    for message <- KafkaEx.stream("subscriptions", 0, worker_name: :streaming_worker), acceptable_message?(message.value) do
      [model, action, user, note] = String.split(message.value, "|")
      Wavelength.Endpoint.broadcast("subscriptions", "new", %{model: model, action: action, user: user, note: note}) 
    end
  end

  def acceptable_message?(message) do
    String.contains?(message, "|")
  end
end