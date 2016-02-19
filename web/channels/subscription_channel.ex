defmodule Wavelength.SubscriptionChannel do
  use Phoenix.Channel

  def join(topic, _message, socket) do
    {:ok, socket}
  end

  def handle_in(topic, %{"model" => model, "action" => action, "user" => user, "note" => note}, socket) do
    broadcast! socket, topic, %{model: model, action: action, user: user, note: note}
    {:noreply, socket}
  end

end