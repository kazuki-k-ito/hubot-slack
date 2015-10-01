# herokuのdeploy完了を自分で通知するScript
# herokuのhookを使う
module.exports = (robot) ->
	crypto = require("crypto")

	robot.router.post "/deploy-notify/:room", (req, res) ->
		{ room } = req.params
		robot.messageRoom room, "パワーアップ(#{req.body.release})して帰ってきました。\n<!>> #{req.body.git_log}"
		res.send "ok"
