import tkinter as tk
from game import QuizGame

if __name__ == "__main__":
    root = tk.Tk()
    app = QuizGame(root)
    root.mainloop()
