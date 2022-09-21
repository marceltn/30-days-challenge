defmodule App.ChallengesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App.Challenges` context.
  """

  @doc """
  Generate a info.
  """
  def info_fixture(attrs \\ %{}) do
    {:ok, info} =
      attrs
      |> Enum.into(%{
        name: "some name",
        start_date: ~D[2022-09-20]
      })
      |> App.Challenges.create_info()

    info
  end
end
