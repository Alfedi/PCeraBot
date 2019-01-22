defmodule PceraBot.Bot do
  @bot :PCeraBot

  use ExGram.Bot,
    name: @bot

  def bot(), do: @bot

  def handle({:command, "start", _msg}, context) do
    answer(context, "Bienvenido al PCeraBot. Explora todo lo que puedo hacer con el comando \help. (WIP).")
  end

  def handle({:command, "download", msg}, context) do
    url = msg.text
    if url != "" do # Necesita comprobar si la url no es válida, preguntar a alguien listo.
      download(url)
      answer(context,"DONE")
    else
      answer(context, "Por favor usa una URL de youtube válida")
    end
  end

  def handle({:command, "ip", _msg}, context) do
    chat = ExGram.Config.get(:pcera_bot, :canal)
    ip = System.cmd("curl", ["https://ipinfo.io/ip"])
    ExGram.send_message(chat, elem(ip, 0))
    answer(context, "El mensaje se ha enviado por tu chat supermegaultrasecreto")
  end
  
  def download(url) do
    IO.puts("MAL, quiero mi mensaje")
    System.cmd("youtube-dl",  ["--extract-audio", "--audio-format", "mp3", "--audio-quality", "0", "--embed-thumbnail", url], cd: "/home/alfedi/Música")
    IO.puts("Acabado")
  end
end
