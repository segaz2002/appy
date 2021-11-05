defmodule :"Elixir.Appy.Repo.Migrations.Create-questions" do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :description, :string
      add :answer, :string

      timestamps()
    end
  end
end
