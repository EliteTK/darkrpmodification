local url = ""
local tabName = "Donations"


local function createF4MenuTab()
	local webPage = vgui.Create("F1HTML")
	webPage:OpenURL(url)
	DarkRP.addF4MenuTab(tabName, webPage)
end
hook.Add("F4MenuTabs", "MyCustomF4MenuTab", createF4MenuTab)
