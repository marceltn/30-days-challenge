defmodule App.ChallengesTest do
  use App.DataCase

  alias App.Challenges

  describe "infos" do
    alias App.Challenges.Info

    import App.ChallengesFixtures

    @invalid_attrs %{name: nil, start_date: nil}

    test "list_infos/0 returns all infos" do
      info = info_fixture()
      assert Challenges.list_infos() == [info]
    end

    test "get_info!/1 returns the info with given id" do
      info = info_fixture()
      assert Challenges.get_info!(info.id) == info
    end

    test "create_info/1 with valid data creates a info" do
      valid_attrs = %{name: "some name", start_date: ~D[2022-09-20]}

      assert {:ok, %Info{} = info} = Challenges.create_info(valid_attrs)
      assert info.name == "some name"
      assert info.start_date == ~D[2022-09-20]
    end

    test "create_info/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Challenges.create_info(@invalid_attrs)
    end

    test "update_info/2 with valid data updates the info" do
      info = info_fixture()
      update_attrs = %{name: "some updated name", start_date: ~D[2022-09-21]}

      assert {:ok, %Info{} = info} = Challenges.update_info(info, update_attrs)
      assert info.name == "some updated name"
      assert info.start_date == ~D[2022-09-21]
    end

    test "update_info/2 with invalid data returns error changeset" do
      info = info_fixture()
      assert {:error, %Ecto.Changeset{}} = Challenges.update_info(info, @invalid_attrs)
      assert info == Challenges.get_info!(info.id)
    end

    test "delete_info/1 deletes the info" do
      info = info_fixture()
      assert {:ok, %Info{}} = Challenges.delete_info(info)
      assert_raise Ecto.NoResultsError, fn -> Challenges.get_info!(info.id) end
    end

    test "change_info/1 returns a info changeset" do
      info = info_fixture()
      assert %Ecto.Changeset{} = Challenges.change_info(info)
    end
  end
end
