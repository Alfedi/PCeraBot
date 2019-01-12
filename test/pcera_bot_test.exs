defmodule PceraBotTest do
  use ExUnit.Case
  doctest PceraBot

  test "greets the world" do
    assert PceraBot.hello() == :world
  end
end
