defmodule TrackVisit.Subscriber do
  @moduledoc """
  The Subscriber context.
  """

  import Ecto.Query, warn: false
  alias TrackVisit.Repo

  alias TrackVisit.Subscriber.Company

  @doc """
  Returns the list of companies.

  ## Examples

      iex> list_companies()
      [%Company{}, ...]

  """
  def list_companies do
    Repo.all(Company)
  end

  @doc """
  Gets a single company.

  Raises `Ecto.NoResultsError` if the Company does not exist.

  ## Examples

      iex> get_company!(123)
      %Company{}

      iex> get_company!(456)
      ** (Ecto.NoResultsError)

  """
  def get_company!(id), do: Repo.get!(Company, id)

  @doc """
  Creates a company.

  ## Examples

      iex> create_company(%{field: value})
      {:ok, %Company{}}

      iex> create_company(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_company(attrs \\ %{}) do
    %Company{}
    |> Company.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a company.

  ## Examples

      iex> update_company(company, %{field: new_value})
      {:ok, %Company{}}

      iex> update_company(company, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_company(%Company{} = company, attrs) do
    company
    |> Company.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Company.

  ## Examples

      iex> delete_company(company)
      {:ok, %Company{}}

      iex> delete_company(company)
      {:error, %Ecto.Changeset{}}

  """
  def delete_company(%Company{} = company) do
    Repo.delete(company)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking company changes.

  ## Examples

      iex> change_company(company)
      %Ecto.Changeset{source: %Company{}}

  """
  def change_company(%Company{} = company) do
    Company.changeset(company, %{})
  end

  alias TrackVisit.Subscriber.Staff

  @doc """
  Returns the list of staffs.

  ## Examples

      iex> list_staffs()
      [%Staff{}, ...]

  """
  def list_staffs do
    Repo.all(Staff)
  end

  @doc """
  Gets a single staff.

  Raises `Ecto.NoResultsError` if the Staff does not exist.

  ## Examples

      iex> get_staff!(123)
      %Staff{}

      iex> get_staff!(456)
      ** (Ecto.NoResultsError)

  """
  def get_staff!(id), do: Repo.get!(Staff, id)

  @doc """
  Creates a staff.

  ## Examples

      iex> create_staff(%{field: value})
      {:ok, %Staff{}}

      iex> create_staff(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_staff(attrs \\ %{}) do
    %Staff{}
    |> Staff.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a staff.

  ## Examples

      iex> update_staff(staff, %{field: new_value})
      {:ok, %Staff{}}

      iex> update_staff(staff, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_staff(%Staff{} = staff, attrs) do
    staff
    |> Staff.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Staff.

  ## Examples

      iex> delete_staff(staff)
      {:ok, %Staff{}}

      iex> delete_staff(staff)
      {:error, %Ecto.Changeset{}}

  """
  def delete_staff(%Staff{} = staff) do
    Repo.delete(staff)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking staff changes.

  ## Examples

      iex> change_staff(staff)
      %Ecto.Changeset{source: %Staff{}}

  """
  def change_staff(%Staff{} = staff) do
    Staff.changeset(staff, %{})
  end

  alias TrackVisit.Subscriber.Visitor

  @doc """
  Returns the list of visitors.

  ## Examples

      iex> list_visitors()
      [%Visitor{}, ...]

  """
  def list_visitors do
    Repo.all(Visitor)
  end

  @doc """
  Gets a single visitor.

  Raises `Ecto.NoResultsError` if the Visitor does not exist.

  ## Examples

      iex> get_visitor!(123)
      %Visitor{}

      iex> get_visitor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_visitor!(id), do: Repo.get!(Visitor, id)

  @doc """
  Creates a visitor.

  ## Examples

      iex> create_visitor(%{field: value})
      {:ok, %Visitor{}}

      iex> create_visitor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_visitor(attrs \\ %{}) do
    %Visitor{}
    |> Visitor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a visitor.

  ## Examples

      iex> update_visitor(visitor, %{field: new_value})
      {:ok, %Visitor{}}

      iex> update_visitor(visitor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_visitor(%Visitor{} = visitor, attrs) do
    visitor
    |> Visitor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Visitor.

  ## Examples

      iex> delete_visitor(visitor)
      {:ok, %Visitor{}}

      iex> delete_visitor(visitor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_visitor(%Visitor{} = visitor) do
    Repo.delete(visitor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking visitor changes.

  ## Examples

      iex> change_visitor(visitor)
      %Ecto.Changeset{source: %Visitor{}}

  """
  def change_visitor(%Visitor{} = visitor) do
    Visitor.changeset(visitor, %{})
  end

  alias TrackVisit.Subscriber.Title

  @doc """
  Returns the list of titles.

  ## Examples

      iex> list_titles()
      [%Title{}, ...]

  """
  def list_titles do
    Repo.all(Title)
  end

  @doc """
  Gets a single title.

  Raises `Ecto.NoResultsError` if the Title does not exist.

  ## Examples

      iex> get_title!(123)
      %Title{}

      iex> get_title!(456)
      ** (Ecto.NoResultsError)

  """
  def get_title!(id), do: Repo.get!(Title, id)

  @doc """
  Creates a title.

  ## Examples

      iex> create_title(%{field: value})
      {:ok, %Title{}}

      iex> create_title(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_title(attrs \\ %{}) do
    %Title{}
    |> Title.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a title.

  ## Examples

      iex> update_title(title, %{field: new_value})
      {:ok, %Title{}}

      iex> update_title(title, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_title(%Title{} = title, attrs) do
    title
    |> Title.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Title.

  ## Examples

      iex> delete_title(title)
      {:ok, %Title{}}

      iex> delete_title(title)
      {:error, %Ecto.Changeset{}}

  """
  def delete_title(%Title{} = title) do
    Repo.delete(title)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking title changes.

  ## Examples

      iex> change_title(title)
      %Ecto.Changeset{source: %Title{}}

  """
  def change_title(%Title{} = title) do
    Title.changeset(title, %{})
  end
end
