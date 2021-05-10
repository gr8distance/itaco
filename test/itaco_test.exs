defmodule ItacoTest do
  use ExUnit.Case
  doctest Itaco

  test "greets the world" do
    assert Itaco.hello() == :world
  end
end
