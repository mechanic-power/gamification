defmodule Gamification do
  @moduledoc """
  Documentation for `Gamification`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Gamification.hello()
      :world

  """
  defstruct total_points: 0, total_percent: 0, scores: [], data: nil

  def hello do
    :world
  end
end
