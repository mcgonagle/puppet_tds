# hardware_platform.rb

Facter.add("role") do
        setcode do
		begin
			Facter.hostname
		rescue
			Facter.loadfacts()
		end
	role = Facter.value('hostname').tr('-0-9','')
	role
        end
end
