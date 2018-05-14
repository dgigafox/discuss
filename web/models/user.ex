defmodule Discuss.User do
    use Discuss.Web, :model

    schema "users" do
      field :email, :string
      field :provider, :string
      field :token, :string
      has_many :topics, Discuss.Topic
      has_many :comments, Discuss.Comment

      timestamps()
    end

    def changeset(struct, params \\ %{}) do
      fields = [:email, :provider, :token]
      struct
      |> cast(params, fields)
      |> validate_required(fields)
    end
end