defmodule Appy.Model.Question do
  use Ecto.Schema
  import Ecto.Changeset

  @fields ~w(description answer)a
  schema "questions" do
    field :description, :string
    field :answer, :string

    timestamps()
  end

  defp changeset(%__MODULE__{} = question, params) do
    question
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
