defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, return a valid changeset" do
      params = %{name: "rafael", email: "rafael@gmail.com", password: "123456"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
        valid?: true,
        changes: %{email: "rafael@gmail.com", name: "rafael", password: "123456"},
        errors: []
      } = response
    end

    test "when there are invalid params, return an invalid changeset" do
      params = %{name: "r", email: "rafael@gmail.com"}

      response = User.changeset(params)

      expected_response = %{name: ["should be at least 2 character(s)"], password: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end
  end
end
