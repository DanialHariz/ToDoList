import reflex as rx
import os

config = rx.Config(
    app_name="ToDoList",
    port=int(os.environ.get("PORT", 3000))
)
# config = rx.Config(
#     app_name="ToDoList",  # This should match the folder 'todo' that contains app.py
    
# )