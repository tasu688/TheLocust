local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer

local function becomeLocust()
    local oldChar = player.Character
    if not oldChar then return end

    local model = ReplicatedStorage:FindFirstChild("TheLocust") or Workspace:FindFirstChild("TheLocust")
    
    if not model then
        warn("Không tìm thấy model 'TheLocust' ở ReplicatedStorage hoặc Workspace!")
        return
  end

    local newChar = model:Clone()
    newChar.Name = player.Name

    local root = oldChar:FindFirstChild("HumanoidRootPart")
    if root then
        newChar:PivotTo(root.CFrame)
    end

    player.Character = newChar
    newChar.Parent = Workspace
    
    if Workspace.CurrentCamera then
        Workspace.CurrentCamera.CameraSubject = newChar:FindFirstChildOfClass("Humanoid")
    end
end

if player.Character then
    becomeLocust()
end

player.CharacterAdded:Connect(function()
    task.wait(1)
    becomeLocust()
end)
