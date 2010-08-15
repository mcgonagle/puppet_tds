# datacenter.rb

Facter.add("datacenter") do
        setcode do
                begin
                        Facter.domain
                rescue
                        Facter.loadfacts()
                end
        domain_var = Facter.value('domain')
        result = case domain_var
                when "buydomains.com" then "crg"
                when "compute-1.internal" then "ec2"
                else "Unknown"
                end
        result
        end
end
