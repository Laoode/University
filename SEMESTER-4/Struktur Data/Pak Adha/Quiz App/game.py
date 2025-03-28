import tkinter as tk
from tkinter import messagebox
from random import choice
from player import Player
from question import Question

class QuizGame:
    def __init__(self, root):
        self.root = root
        self.root.title("Capital City Quiz Game")

        self.players = []
        self.current_player_index = 0
        self.questions_per_player = 0
        self.current_question_index = 0
        self.current_question = None

        self.load_questions()

        self.start_screen()

    def load_questions(self):
        self.questions = []
        with open("countries.txt", "r") as file:
            for line in file:
                country, capital = line.strip().split(":")
                self.questions.append(Question(country, capital))

    def start_screen(self):
        self.clear_screen()
        
        tk.Label(self.root, text="Capital City Quiz Game", font=("Arial", 20)).pack(pady=20)
        
        tk.Label(self.root, text="Number of Players:").pack()
        self.num_players_entry = tk.Entry(self.root)
        self.num_players_entry.pack(pady=10)
        
        tk.Label(self.root, text="Questions per Player:").pack()
        self.num_questions_entry = tk.Entry(self.root)
        self.num_questions_entry.pack(pady=10)

        tk.Button(self.root, text="Start", command=self.setup_players).pack(pady=20)

    def setup_players(self):
        try:
            self.num_players = int(self.num_players_entry.get())
            self.questions_per_player = int(self.num_questions_entry.get())
        except ValueError:
            messagebox.showerror("Invalid input", "Please enter valid numbers")
            return

        self.clear_screen()
        self.player_entries = []

        for i in range(self.num_players):
            tk.Label(self.root, text=f"Player {i+1} Name:").pack()
            entry = tk.Entry(self.root)
            entry.pack(pady=5)
            self.player_entries.append(entry)

        tk.Button(self.root, text="Submit", command=self.create_players).pack(pady=20)

    def create_players(self):
        for entry in self.player_entries:
            name = entry.get().strip()
            if name:
                self.players.append(Player(name))

        if not self.players:
            messagebox.showerror("Invalid input", "Please enter at least one player")
            return

        self.start_game()

    def start_game(self):
        self.clear_screen()
        self.ask_question()

    def ask_question(self):
        if self.current_question_index >= self.questions_per_player:
            self.current_question_index = 0
            self.current_player_index += 1

            if self.current_player_index >= len(self.players):
                self.show_scoreboard()
                return

        self.current_question = choice(self.questions)
        self.questions.remove(self.current_question)

        player = self.players[self.current_player_index]
        tk.Label(self.root, text=f"{player.name}'s turn", font=("Arial", 20)).pack(pady=20)
        tk.Label(self.root, text=f"What is the capital of {self.current_question.country}?", font=("Arial", 15)).pack(pady=20)

        self.answer_entry = tk.Entry(self.root)
        self.answer_entry.pack(pady=10)
        self.answer_entry.bind("<Return>", self.check_answer)
        
        self.check_button = tk.Button(self.root, text="Check", command=self.check_answer)
        self.check_button.pack(pady=20)

    def check_answer(self, event=None):
        answer = self.answer_entry.get().strip()
        player = self.players[self.current_player_index]

        if answer.lower() == self.current_question.capital.lower():
            player.score += 1
            messagebox.showinfo("Correct!", "That's the right answer!")
        else:
            messagebox.showerror("Wrong!", f"The correct answer was {self.current_question.capital}")

        self.current_question_index += 1
        self.start_game()

    def show_scoreboard(self):
        self.clear_screen()
        self.players.sort(key=lambda x: x.score, reverse=True)

        tk.Label(self.root, text="Scoreboard", font=("Arial", 20)).pack(pady=20)
        for player in self.players:
            tk.Label(self.root, text=f"{player.name}: {player.score}").pack(pady=5)
        
        high_score = max(player.score for player in self.players)
        tk.Label(self.root, text=f"High Score: {high_score}", font=("Arial", 15)).pack(pady=20)

        tk.Button(self.root, text="Play Again", command=self.start_screen).pack(pady=20)

    def clear_screen(self):
        for widget in self.root.winfo_children():
            widget.destroy()
