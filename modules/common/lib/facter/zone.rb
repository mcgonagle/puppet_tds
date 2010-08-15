# hardware_platform.rb

Facter.add("zone") do
        setcode do
		begin
			Facter.ipaddress
		rescue
			Facter.loadfacts()
		end
	zone = Facter.value('ipaddress').split('.').reverse
	result = case zone[1].to_i
   		when 0..63 then "prod"
   		when 64..127 then "staging"
   		when 128..191 then "qa"
   		when 192..255 then "dev"
		else "Unknown"
		end
	result
        end
end
