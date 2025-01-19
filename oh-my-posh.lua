load(
	io.popen(
		"oh-my-posh init cmd --config https://raw.githubusercontent.com/AntonRyadovoy/Powershell-nord-theme/refs/heads/main/nordcustom.omp.json"
	):read("*a")
)()
