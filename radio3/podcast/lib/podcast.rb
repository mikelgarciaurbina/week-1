require "podcast/version"
require "podcast/client"

module Podcast
  def self.get_programs(page)
      data = Client.new.get_programs(page)
      data['items'].each do |item|
        puts item['name'] + ': ' + item['id']
      end
      puts "--------------------------------------------> (page #{data['number']} of #{data['totalPages']})"
  end
  def self.get_audios(program_id)
      data = Client.new.get_audios(program_id)
      data['items'].each do |item|
        puts item['longTitle'] + ': ' + item['qualities'][0]['filePath']
      end
      puts "--------------------------------------------> (page #{data['number']} of #{data['totalPages']})"
  end
end