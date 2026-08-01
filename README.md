# File Organizer 📁

A simple desktop GUI application that automatically sorts the files in a folder into subfolders based on file type (Images, Documents, Audio, Video, Archives). Built with Python and [CustomTkinter](https://github.com/TomSchimansky/CustomTkinter).

![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS-blue)
![Python](https://img.shields.io/badge/python-3.9%2B-blue)
![License](https://img.shields.io/badge/license-see%20LICENSE-lightgrey)

## Features

- 🖱️ Native folder picker - no need to type file paths manually
- 🗂️ Automatically sorts files into category subfolders:
  - **Images** - `.jpg` `.jpeg` `.png` `.gif` `.bmp` `.svg`
  - **Documents** - `.pdf` `.docx` `.txt` `.xlsx` `.pptx` `.csv`
  - **Audio** - `.mp3` `.wav` `.flac` `.m4a`
  - **Video** - `.mp4` `.mkv` `.avi` `.mov`
  - **Archives** - `.zip` `.tar` `.gz` `.rar` `.7z`
- 🌙 Dark-mode UI
- ✅ Simple one-click "Organize Files" action with live status feedback

## Screenshots

_Add a screenshot of the app here (e.g. `docs/screenshot.png`) to help new users see what to expect._

## Requirements

- Python 3.9 or newer
- [customtkinter](https://pypi.org/project/customtkinter/)

Tkinter itself ships with most standard Python installations (on some Linux distributions you may need to install `python3-tk` separately).

## Installation

```bash
git clone https://github.com/<your-username>/<your-repo>.git
cd <your-repo>
python -m venv venv
# Windows
venv\Scripts\activate
# macOS/Linux
source venv/bin/activate

pip install customtkinter
```

> New to Python, virtual environments, or the terminal? See [`INSTRUCTION.md`](INSTRUCTION.md) for a complete beginner-friendly walkthrough.

## Usage

```bash
python File_Organizer.py
```

1. Click **Browse** to pick a folder, or type a path directly into the text field.
2. Click **Organize Files**.
3. Files in that folder are moved into `Images/`, `Documents/`, `Audio/`, `Video/`, and `Archives/` subfolders based on their extension. Files with unrecognized extensions are left untouched, and existing subfolders are not touched.

Windows and macOS users can also double-click the included startup scripts (`Start App.bat` / `Start App (Mac).command`) to set up and launch the app automatically - see `INSTRUCTION.md` for details.

## ⚠️ Important Notes

- This tool **moves files**, it does not copy them. Organizing a folder is not easily reversible.
- If a file with the same name already exists in the destination subfolder, the existing behavior depends on your operating system and may overwrite it. **Back up important folders before organizing them.**
- Only files directly inside the selected folder are processed; subfolders are skipped.

## Project Structure

```
.
├── File_Organizer.py # Main application
├── README.md # This file
├── INSTRUCTION.md # Beginner setup & usage guide
├── Start App.bat # Windows one-click launcher
├── Start App (Mac).command # macOS one-click launcher
└── PROJECT_REVIEW.md # Code review / audit report
```

## Contributing

Issues and pull requests are welcome. Please see `PROJECT_REVIEW.md` for a list of known limitations and suggested improvements before contributing.

## License

See the `LICENSE` file for details. _(No LICENSE file currently exists in this repository - see `PROJECT_REVIEW.md` for why you should add one.)_
