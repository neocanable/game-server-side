module Vici
  class << GmCommandEventHandler.instance
    def execute(event)
      command = event.command
      character_id = event._character_id
      character = Character.find_by_id(character_id)
      command_string = command.gsub(/^\//,'')
      GmCommandInterface.gm_command(character, command_string)
    end
  end
end
