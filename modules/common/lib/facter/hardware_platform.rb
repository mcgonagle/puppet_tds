# hardware_platform.rb

Facter.add("hardware_platform") do
        setcode do
                %x{/bin/uname -i}.chomp
        end
end
