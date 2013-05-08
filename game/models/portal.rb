class Portal
  def self.find(portal_id)
    portal = find_and_check_type(portal_id, Vici::LocationType::PORTAL)
    #puts "=========== find portal"
    #p portal
    return unless portal
    destination_id = portal['destination'].to_i
    #puts "=========== destination_id"
    #p destination_id
    return unless destination_id
    destination = find_and_check_type(destination_id, Vici::LocationType::DESTINATION)
    #puts "=========== destination"
    #p destination
    return unless destination
    return portal, destination
  end

  private
    def self.find_and_check_type(id, type)
      #puts "=================== find_and_check_type"
      #p id
      #p type
      loc = Vici::Code.first(:LOCATION, 'id', id)
      #p loc
      loc if loc and loc['type'].to_i == type
    end
end
