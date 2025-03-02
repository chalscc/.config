load(
	io.popen(
		"oh-my-posh init cmd --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/refs/heads/main/themes/kushal.omp.json"
	):read("*a")
)()
