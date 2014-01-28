-- new file
local url = ""
local tabName = "MOTD"


local function createF4MenuTab()
	local webPage = vgui.Create("F1HTML")
	webPage:OpenURL(url)
	DarkRP.addF4MenuTab(tabName, webPage)
end
hook.Add("F4MenuTabs", "MyCustomF4MenuTab", createF4MenuTab)
