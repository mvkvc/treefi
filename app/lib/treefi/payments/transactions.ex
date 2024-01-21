defmodule TreeFi.Payments.Transactions do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transaction" do
    field :denomination, :string
    field :amount, :integer
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(transactions, attrs) do
    transactions
    |> cast(attrs, [:denomination, :amount])
    |> validate_required([:denomination, :amount])
  end
end
