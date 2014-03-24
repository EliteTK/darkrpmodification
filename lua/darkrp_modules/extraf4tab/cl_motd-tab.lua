-- new file
local url = "http://drive-html-viewer.pansy.at/?state=%7B%22ids%22:%5B%220B7hE4IIlxPTsU0FmVXJxbEVwem8%22%5D,%22action%22:%22open%22,%22userId%22:%22102474662643947018831%22%7D"
local tabName = "MOTD"


local function createF4MenuTab()
	local webPage = vgui.Create("F1HTML")
	webPage:OpenURL(url)
	DarkRP.addF4MenuTab(tabName, webPage)
end
hook.Add("F4MenuTabs", "MOTDTab", createF4MenuTab)
