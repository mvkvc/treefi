defmodule TreeFi.Payments do
  @moduledoc """
  The Payments context.
  """

  import Ecto.Query, warn: false
  alias TreeFi.Repo

  alias TreeFi.Payments.Accounts

  @doc """
  Returns the list of account.

  ## Examples

      iex> list_account()
      [%Accounts{}, ...]

  """
  def list_account do
    Repo.all(Accounts)
  end

  @doc """
  Gets a single accounts.

  Raises `Ecto.NoResultsError` if the Accounts does not exist.

  ## Examples

      iex> get_accounts!(123)
      %Accounts{}

      iex> get_accounts!(456)
      ** (Ecto.NoResultsError)

  """
  def get_accounts!(id), do: Repo.get!(Accounts, id)

  @doc """
  Creates a accounts.

  ## Examples

      iex> create_accounts(%{field: value})
      {:ok, %Accounts{}}

      iex> create_accounts(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_accounts(attrs \\ %{}) do
    %Accounts{}
    |> Accounts.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a accounts.

  ## Examples

      iex> update_accounts(accounts, %{field: new_value})
      {:ok, %Accounts{}}

      iex> update_accounts(accounts, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_accounts(%Accounts{} = accounts, attrs) do
    accounts
    |> Accounts.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a accounts.

  ## Examples

      iex> delete_accounts(accounts)
      {:ok, %Accounts{}}

      iex> delete_accounts(accounts)
      {:error, %Ecto.Changeset{}}

  """
  def delete_accounts(%Accounts{} = accounts) do
    Repo.delete(accounts)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking accounts changes.

  ## Examples

      iex> change_accounts(accounts)
      %Ecto.Changeset{data: %Accounts{}}

  """
  def change_accounts(%Accounts{} = accounts, attrs \\ %{}) do
    Accounts.changeset(accounts, attrs)
  end

  alias TreeFi.Payments.Transactions

  @doc """
  Returns the list of transaction.

  ## Examples

      iex> list_transaction()
      [%Transactions{}, ...]

  """
  def list_transaction do
    Repo.all(Transactions)
  end

  @doc """
  Gets a single transactions.

  Raises `Ecto.NoResultsError` if the Transactions does not exist.

  ## Examples

      iex> get_transactions!(123)
      %Transactions{}

      iex> get_transactions!(456)
      ** (Ecto.NoResultsError)

  """
  def get_transactions!(id), do: Repo.get!(Transactions, id)

  @doc """
  Creates a transactions.

  ## Examples

      iex> create_transactions(%{field: value})
      {:ok, %Transactions{}}

      iex> create_transactions(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_transactions(attrs \\ %{}) do
    %Transactions{}
    |> Transactions.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a transactions.

  ## Examples

      iex> update_transactions(transactions, %{field: new_value})
      {:ok, %Transactions{}}

      iex> update_transactions(transactions, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_transactions(%Transactions{} = transactions, attrs) do
    transactions
    |> Transactions.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a transactions.

  ## Examples

      iex> delete_transactions(transactions)
      {:ok, %Transactions{}}

      iex> delete_transactions(transactions)
      {:error, %Ecto.Changeset{}}

  """
  def delete_transactions(%Transactions{} = transactions) do
    Repo.delete(transactions)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking transactions changes.

  ## Examples

      iex> change_transactions(transactions)
      %Ecto.Changeset{data: %Transactions{}}

  """
  def change_transactions(%Transactions{} = transactions, attrs \\ %{}) do
    Transactions.changeset(transactions, attrs)
  end
end
