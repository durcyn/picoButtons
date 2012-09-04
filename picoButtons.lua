local ldb = LibStub:GetLibrary("LibDataBroker-1.1")
local microcoord = {0, 1, 22/64, 1}


local i = 0
local function helper(title, label, click, icon, coords)
	ldb:NewDataObject(i.. " MicroButton "..title, {
		type = "launcher",
		icon = icon or "Interface\\Buttons\\UI-MicroButton-"..title.."-Up",
		texcoord = coords or (not icon and microcoord),
		iconCoords = coords or (not icon and microcoord),
		OnClick = click, 
		label = label,
	})
	i = i + 1
end


local x = MainMenuMicroButton:GetScript("OnMouseUp")
local function mainmenu(self, ...) self.down = 1; x(self, ...) end

helper("Character", CHARACTER_BUTTON, function() ToggleCharacter("PaperDollFrame") end, "Interface\\GroupFrame\\UI-Group-LeaderIcon")
helper("Spellbook", SPELLBOOK_ABILITIES_BUTTON, function() ToggleSpellBook(BOOKTYPE_SPELL) end)
helper("Talents", TALENTS_BUTTON, function() ToggleTalentFrame() end)
helper("Achievement", ACHIEVEMENT_BUTTON, function() ToggleAchievementFrame() end)
helper("Quest", QUESTLOG_BUTTON, function() ToggleFrame(QuestLogFrame) end)
helper("Guild", GUILD, ToggleGuildFrame, "Interface\\Buttons\\UI-MicroButton-Socials-Up", microcoord)
helper("PVP", PLAYER_V_PLAYER, TogglePVPFrame, "Interface\\TargetingFrame\\UI-PVP-"..UnitFactionGroup("player"), {0, 5/8, 0, 5/8})
helper("LFD", DUNGEONS_BUTTON, function() PVEFrame_ToggleFrame() end, "Interface\\Buttons\\UI-MicroButton-LFG-Up", microcoord)
helper("Mounts", MOUNTS_AND_PETS, TogglePetJournal)
helper("EJ", ENCOUNTER_JOURNAL, ToggleEncounterJournal)
helper("MainMenu", MAINMENU_BUTTON, mainmenu)
helper("Help", HELP_BUTTON, ToggleHelpFrame)


---------------------------
--      About panel      --
---------------------------

local about = LibStub("tekKonfig-AboutPanel").new(nil, "picoButtons")
