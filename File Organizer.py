import customtkinter as ctk
import os
import shutil
# Import filedialog module to open the native Windows directory picker window
from tkinter import filedialog

# App appearance
ctk.set_appearance_mode("dark")
ctk.set_default_color_theme("blue")

# Main window
app = ctk.CTk()
app.title("File Organizer")
app.geometry("450x450")
app.resizable(False, False)

EXT_MAP = {
    'Images': ['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.svg'],
    'Documents': ['.pdf', '.docx', '.txt', '.xlsx', '.pptx', '.csv'],
    'Audio': ['.mp3', '.wav', '.flac', '.m4a'],
    'Video': ['.mp4', '.mkv', '.avi', '.mov'],
    'Archives': ['.zip', '.tar', '.gz', '.rar', '.7z']
}

def browse_folder():
    """Opens a native file explorer directory chooser window and saves selection string to input box field."""
    selected_directory = filedialog.askdirectory()
    if selected_directory:
        path_entry.delete(0, "end")
        path_entry.insert(0, selected_directory)
        status_label.configure(text="Folder selected! Ready to organize.", text_color="#1f6aa5")

def organize_folder():
    target_dir = path_entry.get().strip()
    if not target_dir or not os.path.exists(target_dir):
        status_label.configure(text="Invalid directory path!❌", text_color="#D32F2F")
        return
    
    try:
        count = 0
        for filename in os.listdir(target_dir):
            file_path = os.path.join(target_dir, filename)
            if os.path.isdir(file_path):
                continue
                
            file_ext = os.path.splitext(filename)[1].lower()
            for folder_name, extensions in EXT_MAP.items():
                if file_ext in extensions:
                    dest_folder = os.path.join(target_dir, folder_name)
                    os.makedirs(dest_folder, exist_ok=True)
                    shutil.move(file_path, os.path.join(dest_folder, filename))
                    count += 1
                    break
        status_label.configure(text=f"Success! Organized {count} files. 🎉", text_color="#1f6aa5")
    except Exception:
        status_label.configure(text="Error processing files.", text_color="#D32F2F")

# UI Elements
title_label = ctk.CTkLabel(app, text="File Organizer", height=60, font=("Arial", 28, "bold"))
title_label.pack(fill="x", padx=20, pady=(20, 5))

info_label = ctk.CTkLabel(
    app, 
    text="Select or enter the path to the directory you want to clean up:", 
    font=("Arial", 14), 
    wraplength=380
)
info_label.pack(pady=10)

# Input Row Frame (Combines Entry Field and Browse Button horizontally)
input_frame = ctk.CTkFrame(app, fg_color="transparent")
input_frame.pack(fill="x", padx=20, pady=10)
input_frame.columnconfigure(0, weight=3)
input_frame.columnconfigure(1, weight=1)

path_entry = ctk.CTkEntry(input_frame, placeholder_text="Select a folder...", font=("Arial", 14), height=50, corner_radius=12)
path_entry.grid(row=0, column=0, padx=(0, 5), sticky="nsew")

btn_browse = ctk.CTkButton(input_frame, text="📁 Browse", font=("Arial", 14, "bold"), height=50, corner_radius=12, fg_color="#555555", hover_color="#333333", command=browse_folder)
btn_browse.grid(row=0, column=1, padx=(5, 0), sticky="nsew")

status_label = ctk.CTkLabel(app, text="System Ready", font=("Arial", 14, "italic"))
status_label.pack(pady=15)

btn_organize = ctk.CTkButton(app, text="Organize Files", font=("Arial", 16, "bold"), height=60, corner_radius=12, command=organize_folder)
btn_organize.pack(fill="x", padx=20, pady=(5, 20))

app.mainloop()
