defmodule PCeraBot.Bot do
  @bot :PceraBot

  require Logger
  
  use ExGram.Bot,
    name: @bot

  def bot(), do: @bot

  def handle({:command, "start", _}, context) do
    answer(context, "Bienvenido al PCeraBot")
  end

  def handle({:command, "turnon", _}, context) do
    WOL.send("78:44:76:a8:43:5a")
    answer(context, "Hecho, ya se está encendiendo.")
  end
end
