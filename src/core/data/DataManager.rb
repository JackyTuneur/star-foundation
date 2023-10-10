require 'json'
require 'nokogiri'

class DataManager

  # Data from the game
  @@event_data

  def self.event_data
    @@event_data
  end

  # On create, load the event data
  def self.init_data
    load_event_data
  end

  def self.load_event_data
    file = File.open "./resources/history_data.json"
    json = JSON.load file
    @@event_data = json["events"]
  end

  def self.save_game_data
    doc = Nokogiri::XML(File.open('./resources/save_data.xml'))
    save_player_stats(doc)
    # Accéder à l'élément où vous souhaitez enregistrer la valeur
    element1 = doc.at('events')

    # Définir la valeur de l'élément
    element1.content = 'Nouveau contenu pour l\'élément 1'

    # Enregistrer le document XML mis à jour dans un fichier
    File.open('./resources/player_save_data.xml', 'w') do |file|
      file.puts(doc.to_xml)
    end
  end

  # Save the player stats in the xml doc
  def save_player_stats(doc)
    # The player save stats function
    stats = doc.css("stats/stat")

    stats.each do |stat|
      # stat.at('name').content = "caca"
      # print(stat.at('name'))
      # print(stat.at('value'))
    end
  end
end