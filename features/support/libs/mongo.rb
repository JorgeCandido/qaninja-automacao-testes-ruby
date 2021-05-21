require 'mongo'

Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDB
    
    def remove_user(email)
        client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
        users = client[:users]
        users.delete_many({email: email})  
    end 

    def get_user(email)
        client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
        users = client[:users]
        user = users.find({email: email}).first
        return user[:_id]
        # Verificar qual ID do usuário
        # puts user[:_id].class
    end

    def remove_equipo(name, email) 
        user_id = get_user(email)
        client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
        equipos = client[:equipos]
        equipos.delete_many({name: name, user: user_id})  
    end
end

# Código colocado para testar os valores de ID do objeto a ser deletado
# MongoDB.new.get_user("gabigol@gmail.com")


