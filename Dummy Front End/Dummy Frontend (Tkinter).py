import tkinter as tk
from tkinter import ttk, messagebox

# Data storage (in-memory for now)
players = []
servers = []
game_modes = []
matches = []

# Main App
root = tk.Tk()
root.title("Multiplayer Matchmaking System")
root.geometry("800x600")

# ------------------ PLAYER SECTION ------------------
tk.Label(root, text="Add Player").grid(row=0, column=0, sticky='w', padx=10)
player_name_entry = tk.Entry(root)
player_name_entry.grid(row=0, column=1)

def add_player():
    name = player_name_entry.get()
    if name:
        players.append(name)
        update_dropdowns()
        player_name_entry.delete(0, tk.END)
        messagebox.showinfo("Player Added", f"{name} added!")

tk.Button(root, text="Add Player", command=add_player).grid(row=0, column=2)

# ------------------ SERVER SECTION ------------------
tk.Label(root, text="Add Server").grid(row=1, column=0, sticky='w', padx=10)
server_name_entry = tk.Entry(root)
server_name_entry.grid(row=1, column=1)

def add_server():
    server = server_name_entry.get()
    if server:
        servers.append(server)
        update_dropdowns()
        server_name_entry.delete(0, tk.END)
        messagebox.showinfo("Server Added", f"{server} added!")

tk.Button(root, text="Add Server", command=add_server).grid(row=1, column=2)

# ------------------ GAME MODE SECTION ------------------
tk.Label(root, text="Add Game Mode").grid(row=2, column=0, sticky='w', padx=10)
gamemode_entry = tk.Entry(root)
gamemode_entry.grid(row=2, column=1)

def add_gamemode():
    mode = gamemode_entry.get()
    if mode:
        game_modes.append(mode)
        update_dropdowns()
        gamemode_entry.delete(0, tk.END)
        messagebox.showinfo("Game Mode Added", f"{mode} added!")

tk.Button(root, text="Add Game Mode", command=add_gamemode).grid(row=2, column=2)

# ------------------ MATCH CREATION ------------------
tk.Label(root, text="\nCreate Match", font=('Arial', 12, 'bold')).grid(row=3, column=0, sticky='w', padx=10, pady=(20, 5))

tk.Label(root, text="Player 1").grid(row=4, column=0, sticky='e')
player1_cb = ttk.Combobox(root, values=players, state="readonly")
player1_cb.grid(row=4, column=1)

tk.Label(root, text="Player 2").grid(row=5, column=0, sticky='e')
player2_cb = ttk.Combobox(root, values=players, state="readonly")
player2_cb.grid(row=5, column=1)

tk.Label(root, text="Server").grid(row=6, column=0, sticky='e')
server_cb = ttk.Combobox(root, values=servers, state="readonly")
server_cb.grid(row=6, column=1)

tk.Label(root, text="Game Mode").grid(row=7, column=0, sticky='e')
gamemode_cb = ttk.Combobox(root, values=game_modes, state="readonly")
gamemode_cb.grid(row=7, column=1)

def create_match():
    p1 = player1_cb.get()
    p2 = player2_cb.get()
    server = server_cb.get()
    mode = gamemode_cb.get()
    
    if p1 and p2 and server and mode and p1 != p2:
        match = f"{p1} vs {p2} on {server} [{mode}]"
        matches.append(match)
        match_listbox.insert(tk.END, match)
        messagebox.showinfo("Match Created", match)
    else:
        messagebox.showwarning("Invalid", "Please select different players, and fill all fields.")

tk.Button(root, text="Create Match", command=create_match).grid(row=8, column=1, pady=10)

# ------------------ MATCH LIST ------------------
tk.Label(root, text="All Matches", font=('Arial', 12)).grid(row=9, column=0, sticky='w', padx=10, pady=(20, 5))
match_listbox = tk.Listbox(root, width=80, height=10)
match_listbox.grid(row=10, column=0, columnspan=3, padx=10)

# ------------------ Update Dropdowns ------------------
def update_dropdowns():
    player1_cb['values'] = players
    player2_cb['values'] = players
    server_cb['values'] = servers
    gamemode_cb['values'] = game_modes

root.mainloop()
