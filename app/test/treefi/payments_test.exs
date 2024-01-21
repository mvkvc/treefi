defmodule TreeFi.PaymentsTest do
  use TreeFi.DataCase

  alias TreeFi.Payments

  describe "account" do
    alias TreeFi.Payments.Accounts

    import TreeFi.PaymentsFixtures

    @invalid_attrs %{denomination: nil}

    test "list_account/0 returns all account" do
      accounts = accounts_fixture()
      assert Payments.list_account() == [accounts]
    end

    test "get_accounts!/1 returns the accounts with given id" do
      accounts = accounts_fixture()
      assert Payments.get_accounts!(accounts.id) == accounts
    end

    test "create_accounts/1 with valid data creates a accounts" do
      valid_attrs = %{denomination: "some denomination"}

      assert {:ok, %Accounts{} = accounts} = Payments.create_accounts(valid_attrs)
      assert accounts.denomination == "some denomination"
    end

    test "create_accounts/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Payments.create_accounts(@invalid_attrs)
    end

    test "update_accounts/2 with valid data updates the accounts" do
      accounts = accounts_fixture()
      update_attrs = %{denomination: "some updated denomination"}

      assert {:ok, %Accounts{} = accounts} = Payments.update_accounts(accounts, update_attrs)
      assert accounts.denomination == "some updated denomination"
    end

    test "update_accounts/2 with invalid data returns error changeset" do
      accounts = accounts_fixture()
      assert {:error, %Ecto.Changeset{}} = Payments.update_accounts(accounts, @invalid_attrs)
      assert accounts == Payments.get_accounts!(accounts.id)
    end

    test "delete_accounts/1 deletes the accounts" do
      accounts = accounts_fixture()
      assert {:ok, %Accounts{}} = Payments.delete_accounts(accounts)
      assert_raise Ecto.NoResultsError, fn -> Payments.get_accounts!(accounts.id) end
    end

    test "change_accounts/1 returns a accounts changeset" do
      accounts = accounts_fixture()
      assert %Ecto.Changeset{} = Payments.change_accounts(accounts)
    end
  end
end
