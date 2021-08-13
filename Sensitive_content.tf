resource "local_file" "games" {
	filename = "/root/fav_games.txt"
	sensitive_content = "Fifa 2021"
}
