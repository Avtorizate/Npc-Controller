-----------------------UtilizationLmao---------------------------------
ParentOfAll = Instance.new("ScreenGui",game.Players.LocalPlayer.PlayerGui)
FrameOfall = Instance.new("Frame",ParentOfAll)
FrameOfall.Size = UDim2.new(0, 143,0, 428)
FrameOfall.Position = UDim2.new(0.819, 0,0.091, 0)
FrameOfall.BackgroundColor3 = Color3.fromRGB(0,0,0)
FrameOfall.BorderColor3 = Color3.fromRGB(255,255,255)
FrameOfall.BorderSizePixel = 4
function UC(GUICOMP)
	local U = Instance.new("UICorner")
	U.Parent = GUICOMP
	U.CornerRadius = UDim.new(0,30)
end
----------------------MoveThingFr--------------------------------------
MoveButton = Instance.new("TextButton",FrameOfall)
UC(MoveButton)
MoveButton.BackgroundColor3 = Color3.fromRGB(0,85,255)
MoveButton.Position = UDim2.new(0.285, 0,0.01, 0)
MoveButton.Size = UDim2.new(0, 60,0, 60)
MoveButton.Text = "Follow Mode"
MoveButton.TextColor3 = Color3.new(255,255,255)
---------------------KidnapThingFr-------------------------------------
KidnapButton = Instance.new("TextButton",FrameOfall)
UC(KidnapButton)
KidnapButton.BackgroundColor3 = Color3.fromRGB(255,0,0)
KidnapButton.Position = UDim2.new(0.285, 0,0.228, 0)
KidnapButton.Size = UDim2.new(0, 60,0, 60)
KidnapButton.Text = "Kidnap NPC Mode"
KidnapButton.TextColor3 = Color3.new(255,255,255)
-----------------------SitThingFr--------------------------------------
SitButton = Instance.new("TextButton",FrameOfall)
UC(SitButton)
SitButton.BackgroundColor3 = Color3.fromRGB(85,170,0)
SitButton.Size = UDim2.new(0, 60,0, 60)
SitButton.Position = UDim2.new(0.285, 0,0.441, 0)
SitButton.Text = "Sit Mode"
SitButton.TextColor3 = Color3.new(255,255,255)
-----------------------JumpThingFr-------------------------------------
JumpButton = Instance.new("TextButton",FrameOfall)
UC(JumpButton)
JumpButton.BackgroundColor3 = Color3.fromRGB(255,200,0)
JumpButton.Size = UDim2.new(0, 60,0, 60)
JumpButton.Position = UDim2.new(0.285, 0,0.644, 0)
JumpButton.Text = "NPC single jump"
JumpButton.TextColor3 = Color3.new(255,255,255)
-----------------------KillThingFr-------------------------------------
KillButton = Instance.new("TextButton",FrameOfall)
UC(KillButton)
KillButton.BackgroundColor3 = Color3.fromRGB(85, 0, 127)
KillButton.Position = UDim2.new(0.285, 0,0.847, 0)
KillButton.Size = UDim2.new(0, 60,0, 60)
KillButton.Text = "Death"
KillButton.TextColor3 = Color3.new(255,255,255)
-----------------------WholeCodeLOL------------------------------------

following = false
kidnap = false
sit = false
MoveButton.MouseButton1Click:Connect(function()
	if following == false then
		following = true
		pcall(function()
		for _,g in pairs(workspace:GetChildren()) do
		if g:FindFirstChildOfClass("Humanoid") then
			if game.Players:FindFirstChild(g.Name) == nil then
				print(g.Name.." is now following you!")
				coroutine.resume(coroutine.create(function()
				repeat
				g.Humanoid:MoveTo(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
				wait()	
				until following == false	
				end))
				end
			end
		end
	end)
	elseif following == true then
	print("They lost interest in you :|")
	following = false	
	end
end)
KidnapButton.MouseButton1Click:Connect(function()			
	if kidnap == false then
		kidnap = true
	for _,g in pairs(workspace:GetChildren()) do
		if g:FindFirstChildOfClass("Humanoid") then
			if game.Players:FindFirstChild(g.Name) == nil then
				pcall(function()
					print(g.Name.." is now kidnapped heheheha")
					
					g.Humanoid.PlatformStand = true
					rope = Instance.new("RopeConstraint")
					attachment1 = Instance.new("Attachment")
					attachment2 = Instance.new("Attachment")
					attachment1.Name = "Attach1"
					attachment2.Name = "Attach2"
                    if g:FindFirstChild("HumanoidRootPart") then
                    attachment1.Parent = g.HumanoidRootPart    
                    elseif g:FindFirstChild("UpperTorso") then
                    attachment1.Parent = g.UpperTorso
                    elseif g:FindFirstChild("Torso") then       
                    attachment1.Parent = g.Torso
                    end
                    if g:FindFirstChild("UpperTorso") then
					attachment2.Parent = game.Players.LocalPlayer.Character.RightHand
                    elseif g:FindFirstChild("Torso") then
                    game.Players.LocalPlayer.Character:FindFirstChild("Right Arm")
                    end					
                    if game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
						attachment2.Position = game.Players.LocalPlayer.Character:FindFirstChild("Right Arm").RightGript.Attachment
					end
					rope.Attachment0 = attachment1
					rope.Attachment1 = attachment2
					rope.Parent = game.Players.LocalPlayer.Character
					rope.Visible = true
					rope.Length = 10
				
				end
			end
		end
	end)
	elseif kidnap == true then
		for _,g in pairs(workspace:GetChildren()) do
			if g:FindFirstChildOfClass("Humanoid") then
				if game.Players:FindFirstChild(g.Name) == nil then
					pcall(function()
					print(g.Name.." is now not kidnapped :(") 
					g.Humanoid.PlatformStand = false
					local rope2 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("RopeConstraint")
                    if g:FindFirstChild("HumanoidRootPart") then
                    g.HumanoidRootPart.Attach1:Destroy()    
                    elseif g:FindFirstChild("UpperTorso") then
                    g.UpperTorso.Attach1:Destroy()
                    elseif g:FindFirstChild("Torso") then       
                    g.Torso.Attach1:Destroy()
                    end					
                    if game.Players.LocalPlayer.Character:FindFirstChild("UpperTorso") then
					game.Players.LocalPlayer.Character.RightHand:FindFirstChild("Attach2"):Destroy()
					elseif game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
					game.Players.LocalPlayer.Character:FindFirstChild("Right Arm").Attach2:Destroy()
					end
					rope2:Destroy()
				end
			end
		end
	kidnap = false	
	end
end)
end)
SitButton.MouseButton1Click:Connect(function()			
	if sit == false then
		sit = true
		for _,g in pairs(workspace:GetChildren()) do
			if g:FindFirstChildOfClass("Humanoid") then
				if game.Players:FindFirstChild(g.Name) == nil then
					print(g.Name.." is taking a rest")

					g.Humanoid.Sit = true
				end
			end
		end
	elseif sit == true then
		for _,g in pairs(workspace:GetChildren()) do
			if g:FindFirstChildOfClass("Humanoid") then
				if game.Players:FindFirstChild(g.Name) == nil then
					print(g.Name.." you interrupted their rest :D") 
					g.Humanoid.Sit = false
				end
			end
		end
		sit = false	
	end
end)
JumpButton.MouseButton1Click:Connect(function()
	for _,g in pairs(workspace:GetChildren()) do
		if g:FindFirstChildOfClass("Humanoid") then
			if game.Players:FindFirstChild(g.Name) == nil then
				print(g.Name.." is a jumpy boi")
				g.Humanoid.Jump = true
				wait()
				g.Humanoid.Jump = false
			end
		end
	end
end)
KillButton.MouseButton1Click:Connect(function()
	for _,g in pairs(workspace:GetChildren()) do
		if g:FindFirstChildOfClass("Humanoid") then
			if game.Players:FindFirstChild(g.Name) == nil then
				print(g.Name.. "'s life trial have expired")
				g.Humanoid.Health = 0
			end
		end
	end
end)
