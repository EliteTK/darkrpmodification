
if SERVER then
        AddCSLuaFile("shared.lua")
end
 
if CLIENT then --Client stuff
        SWEP.PrintName = "Pay Day Baton" --Name
        SWEP.Slot = 1
        SWEP.SlotPos = 3
        SWEP.DrawAmmo = false --Draw ammo in bottom right corner
        SWEP.DrawCrosshair = false --Draw crosshair?
end
 
SWEP.Author = "KillerLUA" --Author
SWEP.Instructions = "Left or right click to give the player a pay day" --How to use
SWEP.Contact = "" --Contact
SWEP.Purpose = "Gives people paydays" --Purpose
 
SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix = "stunstick"
 
SWEP.Spawnable = false --Not spawnable by non-admin players
SWEP.AdminSpawnable = true --Only spawnable by admins!
 
SWEP.NextStrike = 0
 
SWEP.ViewModel = Model("models/weapons/v_stunstick.mdl") --The model while being held
SWEP.WorldModel = Model("models/weapons/w_stunbaton.mdl") --World model (on the ground)
 
SWEP.Sound = Sound("weapons/stunstick/stunstick_swing1.wav") --The sound
 
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""
 
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""
 
function SWEP:Initialize()
        if SERVER then self:SetWeaponHoldType("normal") end --Set the hold type
end
 
function SWEP:PrimaryAttack()
        if CurTime() < self.NextStrike then return end
 
        if SERVER then
                self:SetWeaponHoldType("melee")
                timer.Simple(0.3, function(wep) if IsValid(wep) then wep:SetWeaponHoldType("normal") end end, self) --Checks that the swep hasn't quickly been switched
        end
        self.Owner:SetAnimation(PLAYER_ATTACK1)
        self.Weapon:EmitSound(self.Sound) ---Emit a sound, the stunstick wack
        self.Weapon:SendWeaponAnim(ACT_VM_HITCENTER)
 
        self.NextStrike = CurTime() + .4
 
        if CLIENT then return end --No clients past here
 
        local trace = self.Owner:GetEyeTrace()

        if not IsValid(trace.Entity) or not trace.Entity:IsPlayer() then return end
        trace.Entity:payDay() --Give them a payday
end
 
function SWEP:SecondaryAttack()
        self:PrimaryAttack() --Run Primary Attack
end
