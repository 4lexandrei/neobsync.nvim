local config = require("neobsync.config")

local M = {}
local udp_client = nil

function M.start()
	if not udp_client then
		udp_client = vim.uv.new_udp()
	end
end

function M.send_data(data)
	if not udp_client then
		M.start()
	end

	if udp_client then
		local payload = vim.json.encode(data)
		udp_client:send(payload, config.HOST, config.PORT, function(err)
			if err then
				print("Failed to send data:", err)
			end
		end)
	end
end

function M.close()
	if udp_client then
		udp_client:close()
		udp_client = nil
	end
end

return M
