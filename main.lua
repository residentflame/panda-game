
function love.load()
    Object = require "classic"
    require "entities.player"
    require "entities.enemy"
    require "entities.bullet"
    player = Player()
    enemy = Enemy()
    listOfBullets = {}
end

function love.keypressed(key)
    player:keyPressed(key)
end

function love.update(dt)
    player:update(dt)
    enemy:update(dt)

    for i,v in ipairs(listOfBullets) do
        v:update(dt)   
        v:checkCollision(enemy)

        if v.dead then
            table.remove(listOfBullets, i)
        end
    end
end


function love.draw()
    player:draw()
    enemy:draw()

    for i,v in ipairs(listOfBullets) do
        v:draw()
    end
end

