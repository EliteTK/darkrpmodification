-- new file
local url = "http://84.22.98.59/motd"
local tabName = "MOTD"


local function createF4MenuTab()
	local webPage = vgui.Create("F1HTML")
	webPage:OpenURL(url)
	DarkRP.addF4MenuTab(tabName, webPage)
end
hook.Add("F4MenuTabs", "MOTDTab", createF4MenuTab)
