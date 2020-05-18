defmodule Gamification.Score do
  @moduledoc """
  Documentation for `Gamification.Score`.
  """
  defstruct total_points: 0, total_percent: 0.0, completed: [], scores: [], data: nil

  alias Gamification.Score

  @doc """
  Hello world.
  """
  def add_score_success(%Score{completed: completed} = score, points, key, message, keys \\ []) when is_binary(message) and is_integer(points) do
    %{
      score
      | completed: [{key, {message, [{:points, points} | keys]}} | completed],
        total_points: score.total_points + points,
        total_percent: (score.total_points * score.total_percent + points) / (score.total_points + points)
    }
  end

  def add_score_failure(%Score{scores: scores} = score, points, key, message, keys \\ []) when is_binary(message) and is_integer(points) do
    %{
      score
      | scores: [{key, {message, [{:points, points} | keys]}} | scores],
        total_points: score.total_points + points,
        total_percent: score.total_points * score.total_percent / (score.total_points + points)
    }
  end

  def score_not_nil(%Score{data: data} = score, points, key) do
    if data[key] do
      add_score_success(score, points, key, "is filled.", scorer: :not_nil)
    else
      add_score_failure(score, points, key, "should be filled.", scorer: :not_nil)
    end
  end

  def cast(schema) do
    %Score{
      data: schema
    }
  end
end
