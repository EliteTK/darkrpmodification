local url = "http://sealandowlgaming.com/server/rules"
local tabName = "Rules"


local function createF4MenuTab()
local webPage = vgui.Create("F1HTML")
webPage:OpenURL(url)
DarkRP.addF4MenuTab(tabName, webPage)
end
hook.Add("F4MenuTabs", "rulesTab", createF4MenuTab)
