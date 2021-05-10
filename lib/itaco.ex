defmodule Itaco do
  require IEx

  defmacro __using__(schema: schema, repo: repo) do
    quote do
      alias unquote(repo)

      import Ecto.Query

      def all do
        unquote(schema)
        |> Repo.all()
      end

      def find(id) do
        unquote(schema)
        |> Repo.get!(id)
      end

      def find_by(conds) do
        unquote(schema)
        |> Repo.get_by(conds)
      end

      def where(conds) do
        from(unquote(schema), where: ^conds)
        |> Repo.all()
      end

      def insert(attr) do
        %unquote(schema){}
        |> unquote(schema).changeset(attr)
        |> Repo.insert()
      end

      def insert!(attr) do
        %unquote(schema){}
        |> unquote(schema).changeset(attr)
        |> Repo.insert!()
      end

      def insert_all(maps, opts \\ []) do
        now = DateTime.utc_now() |> NaiveDateTime.truncate(:second)

        changesets =
          maps
          |> Enum.map(fn map -> Map.merge(%{inserted_at: now, updated_at: now}, map) end)

        Repo.insert_all(unquote(schema), changesets, opts)
      end

      def update(account, attr) do
        account
        |> unquote(schema).changeset(attr)
        |> Repo.update()
      end

      def update!(account, attr) do
        account
        |> unquote(schema).changeset(attr)
        |> Repo.update!()
      end

      def delete(account), do: Repo.delete(account)
      def delete!(account), do: Repo.delete!(account)

      def delete_all(), do: Repo.delete_all(unquote(schema))
    end
  end
end
