require "pry-nav"
module MyModule
    MAX_CONNECTIONS =5

    def method_one
        puts "ola k ase"
    end

    class ThingOne

    end
end 

include MyModule

puts MyModule::MAX_CONNECTIONS

##binding.pry