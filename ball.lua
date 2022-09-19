Ball = {}

function Ball:load()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.width = 20
    self.height = 20
    self.speed = 200
    self.velocityX = -self.speed
    self.velocityY = 0
end

function Ball:update(dt)
    self:move(dt)
    self:collide()
end
function Ball:move(dt)
    self.x = self.x + self.velocityX * dt
    self.y = self.y + self.velocityY * dt

end

function Ball:collide()
    if Collision(self, Player) then
        self.velocityX = self.speed
        local middleBall = self.y + self.height / 2
        local middlePlayer = Player.y + Player.height / 2
        local collisionPos = middleBall - middlePlayer
        self.velocityY = collisionPos * 5
    end 

    if Collision(self, AI) then
        self.velocityX = -self.speed
        local middleBall = self.y + self.height / 2
        local middleAI = AI.y + AI.height / 2
        local collisionPos = middleBall - middleAI
        self.velocityY = collisionPos * 5
    end 

    if self.y < 0 then 
        self.y = 0 
        self.velocityY = -self.velocityY
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
        self.velocityY = -self.velocityY
    end

    if self.y < 0 then 
        self.x = love.graphics.getWidth() / 2 - self.width / 2 
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.velocityY = 0
        self.velocityX = self.speed
    end

    if self.x + self.width > love.graphics.getWidth() then
        self.x = love.graphics.getWidth() / 2 - self.width / 2 
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.velocityY = 0
        self.velocityX = -self.speed
    end
end

function Ball:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end