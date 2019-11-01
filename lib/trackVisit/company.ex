defmodule TrackVisit.Company do
  @moduledoc """
  The Company context.
  """

  import Ecto.Query, warn: false
  alias TrackVisit.Repo

  alias TrackVisit.Company.VisitLog

  @doc """
  Returns the list of visitlogs.

  ## Examples

      iex> list_visitlogs()
      [%VisitLog{}, ...]

  """
  def list_visitlogs do
    Repo.all(VisitLog)
  end

  @doc """
  Gets a single visit_log.

  Raises `Ecto.NoResultsError` if the Visit log does not exist.

  ## Examples

      iex> get_visit_log!(123)
      %VisitLog{}

      iex> get_visit_log!(456)
      ** (Ecto.NoResultsError)

  """
  def get_visit_log!(id), do: Repo.get!(VisitLog, id)

  @doc """
  Creates a visit_log.

  ## Examples

      iex> create_visit_log(%{field: value})
      {:ok, %VisitLog{}}

      iex> create_visit_log(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_visit_log(attrs \\ %{}) do
    %VisitLog{}
    |> VisitLog.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a visit_log.

  ## Examples

      iex> update_visit_log(visit_log, %{field: new_value})
      {:ok, %VisitLog{}}

      iex> update_visit_log(visit_log, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_visit_log(%VisitLog{} = visit_log, attrs) do
    visit_log
    |> VisitLog.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a VisitLog.

  ## Examples

      iex> delete_visit_log(visit_log)
      {:ok, %VisitLog{}}

      iex> delete_visit_log(visit_log)
      {:error, %Ecto.Changeset{}}

  """
  def delete_visit_log(%VisitLog{} = visit_log) do
    Repo.delete(visit_log)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking visit_log changes.

  ## Examples

      iex> change_visit_log(visit_log)
      %Ecto.Changeset{source: %VisitLog{}}

  """
  def change_visit_log(%VisitLog{} = visit_log) do
    VisitLog.changeset(visit_log, %{})
  end

  alias TrackVisit.Company.Department

  @doc """
  Returns the list of departments.

  ## Examples

      iex> list_departments()
      [%Department{}, ...]

  """
  def list_departments do
    Repo.all(Department)
  end

  @doc """
  Gets a single department.

  Raises `Ecto.NoResultsError` if the Department does not exist.

  ## Examples

      iex> get_department!(123)
      %Department{}

      iex> get_department!(456)
      ** (Ecto.NoResultsError)

  """
  def get_department!(id), do: Repo.get!(Department, id)

  @doc """
  Creates a department.

  ## Examples

      iex> create_department(%{field: value})
      {:ok, %Department{}}

      iex> create_department(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_department(attrs \\ %{}) do
    %Department{}
    |> Department.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a department.

  ## Examples

      iex> update_department(department, %{field: new_value})
      {:ok, %Department{}}

      iex> update_department(department, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_department(%Department{} = department, attrs) do
    department
    |> Department.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Department.

  ## Examples

      iex> delete_department(department)
      {:ok, %Department{}}

      iex> delete_department(department)
      {:error, %Ecto.Changeset{}}

  """
  def delete_department(%Department{} = department) do
    Repo.delete(department)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking department changes.

  ## Examples

      iex> change_department(department)
      %Ecto.Changeset{source: %Department{}}

  """
  def change_department(%Department{} = department) do
    Department.changeset(department, %{})
  end
end
