defmodule RsvpWeb.EventController do
    use RsvpWeb.Web, :controller

    plug RsvpWeb.AuthorizedPlug, "create" when action in [:create]

    def show(conn, %{"id" => id}) do
        event = Rsvp.EventQueries.get_by_id(id)
        render conn, "details.html", event: event
    end

    def list(conn, _) do
        events = Rsvp.EventQueries.get_all
        render conn, "list.html", events: events 
    end

    def create(conn, %{errors: errors}) do
        render conn, "create.html", changeset: errors
    end

    def create(conn, _) do
        changeset = Rsvp.Events.changeset(%Rsvp.Events{}, %{})
        render conn, "create.html", changeset: changeset
    end

    def add(conn, %{"events" => events}) do
        events = Map.update!(events, "date", fn d -> d <> ":00" end)
        changeset = Rsvp.Events.changeset(%Rsvp.Events{}, events)
        case Rsvp.EventQueries.create changeset do
            {:ok, %{id: id}} -> redirect conn, to: event_path(conn, :show, id)
            {:error, errors} -> create conn, %{errors: errors}
        end
    end

    def reserve(conn, %{"id" => id, "reservation" => %{"quantity" => quantity}}) do
        {:ok, event} = Rsvp.EventQueries.decrease_quantity(id, quantity)
        RsvpWeb.EventChannel.send_update(event)
        redirect conn, to: event_path(conn, :show, id)
    end
end
