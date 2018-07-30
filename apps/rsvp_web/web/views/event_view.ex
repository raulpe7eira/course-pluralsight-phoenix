defmodule RsvpWeb.EventView do
    use RsvpWeb.Web, :view

    def format_date(date) do
        {{y, m, d}, _} = NaiveDateTime.to_erl(date)
        "#{d}/#{m}/#{y}"
    end

    def format_time(date) do
        NaiveDateTime.to_time(date)
        |> Time.to_string
    end
end
