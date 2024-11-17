local config = require("neobsync.config")

local M = {}
local udp_client = vim.uv.new_udp()

function M.send_data(data)
	local payload = vim.json.encode(data)

	udp_client:send(payload, config.HOST, config.PORT, function(err)
		if err then
			print("Failed to send data:", err)
		end
	end)
end

function M.close()
	udp_client:close()
end

return M
