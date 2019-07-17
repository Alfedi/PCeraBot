defmodule PCeraBot.Bot do
  @bot :PceraBot

  require Logger
  
  use ExGram.Bot,
    name: @bot

  def bot(), do: @bot

  def handle({:command, "start", _}, context) do
    answer(context, "Bienvenido al PCeraBot")
  end

end
