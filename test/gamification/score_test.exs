defmodule Gamification.ScoreTest do
  use ExUnit.Case
  alias Gamification.Score

  describe "#add_score" do
    test "greets the world" do
      result =
        %Score{}
        |> Score.add_score_success(10, :name, "is filled")
        |> Score.add_score_success(10, :name, "should be filled")
        |> Score.add_score_failure(5, :name, "is filled")

      assert result == %Gamification.Score{
               data: nil,
               completed: [
                 name: {"should be filled", [points: 10]},
                 name: {"is filled", [points: 10]}
               ],
               scores: [
                 name: {"is filled", [points: 5]}
               ],
               total_percent: 0.8,
               total_points: 25
             }
    end
  end
end
