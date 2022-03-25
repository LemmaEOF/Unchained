require 'jimson'

class Unchained
    extend Jimson::Handler
end

server = Jimson::Server.new(Unchained.new)
server.start # hosts at localhost:8999 for now