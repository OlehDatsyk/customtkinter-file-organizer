# CustomTkinter File Organizer

A sleek, automated desktop file management utility built with Python and the `customtkinter` library. This application helps declutter messy directories (like your Downloads folder) by sorting unorganized files into structured folders based on their file extensions.

<p align="center">
  <img src="https://github.com/user-attachments/assets/e18927d2-c0c8-42ad-840e-659301035609" alt="File Organizer Preview" width="350">
</p>

## 🚀 Features

* **Modern Dark UI:** Beautifully integrated dark-theme styling built completely using CustomTkinter widgets.
* **Native Directory Picker:** Features a dedicated horizontal grid layout coupling a text input field with a native `tkinter.filedialog` folder browser button.
* **Automated Categorization Mapping:** Intelligently maps files into distinct, clean subfolders:
  * 🖼️ **Images:** `.jpg`, `.png`, `.svg`, `.gif`, etc.
  * 📄 **Documents:** `.pdf`, `.docx`, `.txt`, `.csv`, etc.
  * 🎵 **Audio:** `.mp3`, `.wav`, `.flac`, etc.
  * 🎬 **Video:** `.mp4`, `.mkv`, `.mov`, etc.
  * 📦 **Archives:** `.zip`, `.rar`, `.7z`, etc.
* **Safeguarded Directory Processing:** Built-in safeguards protect existing subfolders and gracefully catch file-locking errors using `try-except` blocks.
* **Dynamic Feedback Panel:** A responsive bottom feedback text element that alerts users on directory selection states and reports the total amount of moved items upon a successful run.

## 🛠️ Prerequisites

Before running this project, you will need to have Python installed on your machine.

## 📦 Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/OlehDatsyk/customtkinter-file-organizer.git](https://github.com/OlehDatsyk/customtkinter-file-organizer.git)
   cd customtkinter-file-organizer
