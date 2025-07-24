import reflex as rx
import os

config = rx.Config(
    app_name="ToDoList",
    port=int(os.environ.get("PORT", 8080)),
    api_url=os.environ.get("API_URL", f"http://localhost:{os.environ.get('PORT', 8080)}"),
)

#============original line=========
# config = rx.Config(
#     app_name="ToDoList",  # This should match the folder 'todo' that contains app.py
    
# )