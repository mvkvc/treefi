defmodule TreeFi.PaymentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TreeFi.Payments` context.
  """

  @doc """
  Generate a accounts.
  """
  def accounts_fixture(attrs \\ %{}) do
    {:ok, accounts} =
      attrs
      |> Enum.into(%{
        denomination: "some denomination"
      })
      |> TreeFi.Payments.create_accounts()

    accounts
  end
end
