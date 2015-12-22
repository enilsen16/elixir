people = [
  %{ name: "Grumpy",
  %{ name: "Dave",
  %{ name: "Dopey",
  %{ name: "Shaquille", height: 2.16 }, %{ name: "Sneezy", height: 1.28 }
]

for person = %{height: height} <- people,
  height > 1.5,
  do: IO.inspect person
