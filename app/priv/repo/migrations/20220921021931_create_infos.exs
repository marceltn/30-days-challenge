defmodule App.Repo.Migrations.CreateInfos do
  use Ecto.Migration

  def change do
    create table(:infos) do
      add :name, :string
      add :start_date, :date

      timestamps()
    end
  end
end
