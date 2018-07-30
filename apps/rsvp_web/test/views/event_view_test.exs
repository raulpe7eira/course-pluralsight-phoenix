defmodule RsvpWeb.EventViewTest do
    use RsvpWeb.ConnCase, async: true

    @tag current: true
    test "Should convert a date to a D/M/YY format" do
        formatted = RsvpWeb.EventView.format_date(~N[2000-12-01 13:30:15])
        assert formatted == "1/12/2000"
    end
end
