-- Funktion zum Platzieren des Objekts
local function platziereObjektVorSpieler(character, objekt)
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    -- Bestimme die Position (5 Studs vor dem Spieler)
    local abstand = 5 
    local neuePosition = humanoidRootPart.Position + (humanoidRootPart.CFrame.LookVector * abstand)
    
    -- Objekt positionieren und verankern (damit es nicht runterfällt)
    objekt.Position = neuePosition
    objekt.Anchored = true
    objekt.Parent = game.Workspace
end

-- Wird sofort beim Start/Beitritt aufgerufen
game.Players.PlayerAdded:Connect(function(spieler)
    spieler.CharacterAdded:Connect(function(character)
        -- Erstellt das gewünschte Objekt
        local block = Instance.new("Part")
        block.Size = Vector3.new(3, 3, 3)
        block.BrickColor = BrickColor.new("Bright blue")
        
        -- Sofortiger Aufruf der Funktion
        platziereObjektVorSpieler(character, block)
    end)
end)

