unless (Rsvp.EventQueries.any) do
    Rsvp.EventQueries.create(Rsvp.Events.changeset(%Rsvp.Events{}, %{date: "2018-07-31 09:00:00", title: "Summer Codefest", location: "Omaha, NE"}))
    Rsvp.EventQueries.create(Rsvp.Events.changeset(%Rsvp.Events{}, %{date: "2018-08-19 00:00:00", title: "Charles Spurgeon's Birthday", location: "London"}))
end
