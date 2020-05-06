defmodule SoicTest do
  use ExUnit.Case
  doctest Soic

  test "greets the world" do
    assert Soic.hello() == :world
  end
end
