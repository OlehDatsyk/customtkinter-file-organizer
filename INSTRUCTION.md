# Getting Started with File Organizer - A Complete Beginner's Guide

This guide assumes you have **never used Python, Git, a terminal, or Visual Studio Code before**. Follow every step in order and you'll have the app running.

---

## Table of Contents

1. [What This App Does](#1-what-this-app-does)
2. [Installing Python](#2-installing-python)
3. [Installing Git](#3-installing-git)
4. [Installing Visual Studio Code](#4-installing-visual-studio-code)
5. [Recommended VS Code Extensions](#5-recommended-vs-code-extensions)
6. [Getting the Project onto Your Computer](#6-getting-the-project-onto-your-computer)
7. [Opening the Project in VS Code](#7-opening-the-project-in-vs-code)
8. [Creating a Virtual Environment](#8-creating-a-virtual-environment)
9. [Activating the Virtual Environment](#9-activating-the-virtual-environment)
10. [Installing Dependencies](#10-installing-dependencies)
11. [Running the Application](#11-running-the-application)
12. [Using the App](#12-using-the-app)
13. [Testing the Application](#13-testing-the-application)
14. [Troubleshooting](#14-troubleshooting)
15. [FAQ](#15-faq)
16. [Common Mistakes](#16-common-mistakes)
17. [Security Recommendations](#17-security-recommendations)
18. [Next Learning Steps](#18-next-learning-steps)

---

## 1. What This App Does

File Organizer is a small desktop program with a window and buttons. You pick a folder on your computer, click one button, and it automatically sorts the files in that folder into subfolders like `Images`, `Documents`, `Audio`, `Video`, and `Archives`.

---

## 2. Installing Python

Python is the programming language this app is written in. You need it installed before anything else will work.

### Windows
1. Go to [https://www.python.org/downloads/](https://www.python.org/downloads/).
2. Click the yellow **Download Python** button (it will detect Windows automatically).
3. Run the downloaded installer.
4. **Important:** On the first installer screen, check the box that says **"Add python.exe to PATH"** before clicking Install. This step is easy to miss and causes most beginner problems.
5. Click **Install Now** and wait for it to finish.
6. Open the **Start Menu**, type `cmd`, and press Enter to open Command Prompt.
7. Type `python --version` and press Enter. If you see something like `Python 3.12.0`, it worked.

### macOS
1. Go to [https://www.python.org/downloads/](https://www.python.org/downloads/).
2. Download the macOS installer (`.pkg` file).
3. Open the downloaded file and follow the on-screen instructions (Continue -> Continue -> Agree -> Install).
4. Open **Terminal** (press `Cmd + Space`, type "Terminal", press Enter).
5. Type `python3 --version` and press Enter. You should see a version number.

---

## 3. Installing Git

Git lets you download ("clone") the project code from GitHub.

### Windows
1. Go to [https://git-scm.com/download/win](https://git-scm.com/download/win).
2. Download and run the installer.
3. Keep clicking **Next** on every screen (the defaults are fine for beginners), then **Install**.
4. Open Command Prompt and type `git --version` to confirm it installed.

### macOS
1. Open **Terminal**.
2. Type `git --version` and press Enter.
3. If Git isn't installed, macOS will prompt you to install the "Command Line Developer Tools." Click **Install** and wait for it to finish.

---

## 4. Installing Visual Studio Code

Visual Studio Code (VS Code) is a free code editor that makes it much easier to view and run project files.

1. Go to [https://code.visualstudio.com/](https://code.visualstudio.com/).
2. Click the big download button for your operating system (Windows or macOS).
3. Run the installer / open the downloaded app and drag it into your Applications folder (macOS).
4. Open VS Code once to confirm it launches.

---

## 5. Recommended VS Code Extensions

Once VS Code is open:

1. Click the **Extensions** icon in the left sidebar (it looks like four squares).
2. Search for and install:
   - **Python** (by Microsoft) - adds Python support, syntax highlighting, and run/debug tools.
   - **Pylance** (by Microsoft) - usually installs automatically with the Python extension; provides smarter code suggestions.

---

## 6. Getting the Project onto Your Computer

1. Open Command Prompt (Windows) or Terminal (macOS).
2. Navigate to a folder where you want to store the project, for example your Desktop:
   ```bash
   cd Desktop
   ```
3. Clone the repository (replace the URL with the actual repository URL):
   ```bash
   git clone https://github.com/<your-username>/<your-repo>.git
   ```
4. Move into the new project folder:
   ```bash
   cd <your-repo>
   ```

> If you already have the project as a downloaded ZIP file instead, just extract it to a folder and skip the `git clone` step.

---

## 7. Opening the Project in VS Code

1. Open VS Code.
2. Click **File -> Open Folder...**
3. Select the project folder you just created/cloned.
4. VS Code will show the project files (including `File_Organizer.py`) in the sidebar on the left.

---

## 8. Creating a Virtual Environment

A virtual environment is an isolated space for this project's Python packages, so they don't interfere with other projects on your computer.

1. In VS Code, open a terminal: **Terminal -> New Terminal**.
2. Make sure you're inside the project folder (the terminal prompt should show the project's folder name).
3. Run:
   - **Windows:**
     ```bash
     python -m venv venv
     ```
   - **macOS:**
     ```bash
     python3 -m venv venv
     ```
4. This creates a new folder called `venv` inside your project. This is normal and expected.

---

## 9. Activating the Virtual Environment

You must "activate" the environment every time you work on the project in a new terminal window.

- **Windows (Command Prompt):**
  ```bash
  venv\Scripts\activate
  ```
- **Windows (PowerShell):**
  ```bash
  venv\Scripts\Activate.ps1
  ```
- **macOS:**
  ```bash
  source venv/bin/activate
  ```

When it's active, you'll see `(venv)` at the start of your terminal prompt.

---

## 10. Installing Dependencies

With the virtual environment active, install the one package this app needs:

```bash
pip install customtkinter
```

Wait for it to finish downloading and installing.

---

## 11. Running the Application

With the virtual environment still active, run:

```bash
python File_Organizer.py
```

(On macOS, use `python3 File_Organizer.py` if `python` isn't recognized.)

A dark-themed window titled **"File Organizer"** should appear.

### One-Click Launchers

After you've done the setup above **once**, you can use the included launcher scripts instead of typing commands every time:

- **Windows:** double-click `Start App.bat`
- **macOS:** double-click `Start App (Mac).command`
  - The first time, macOS may block it as being from an "unidentified developer." Right-click the file, choose **Open**, then confirm **Open** in the dialog that appears.

These scripts will check for Python, create/activate the virtual environment, install missing packages, and launch the app automatically.

---

## 12. Using the App

1. Click **📁 Browse** to open your operating system's folder picker, and choose the folder you want to clean up. Alternatively, type or paste a folder path directly into the text box.
2. Click **Organize Files**.
3. Watch the status message below the input box - it will confirm how many files were organized, or show an error if something went wrong.
4. Open the folder in your file explorer/Finder to see the new `Images`, `Documents`, `Audio`, `Video`, and `Archives` subfolders.

**Before you organize an important folder, consider making a backup copy first** - see [Security Recommendations](#17-security-recommendations).

---

## 13. Testing the Application

Since this is a simple script rather than a package with an automated test suite, the easiest way to "test" it safely is:

1. Create a new, throwaway test folder on your Desktop (e.g. `TestFolder`).
2. Copy a few sample files into it with different extensions (e.g. a `.jpg`, a `.pdf`, a `.mp3`).
3. Run the app and point it at `TestFolder`.
4. Confirm the files were sorted correctly and nothing unexpected happened.
5. Only run the app on real, important folders once you're comfortable with how it behaves.

---

## 14. Troubleshooting

| Problem | Likely Cause | Fix |
|---|---|---|
| `'python' is not recognized...` | Python not added to PATH | Reinstall Python and check "Add python.exe to PATH", or use `python3` on macOS |
| `ModuleNotFoundError: No module named 'customtkinter'` | Dependency not installed, or virtual environment not activated | Activate the venv, then run `pip install customtkinter` again |
| Window doesn't open / app closes immediately | An error occurred before the window loaded | Run the app from the terminal (not the launcher) to see the full error message |
| "Invalid directory path!" message | The folder path is empty or doesn't exist | Use the Browse button instead of typing the path manually |
| macOS says the `.command` file "cannot be opened" | Gatekeeper security block | Right-click -> Open -> confirm Open |
| Files didn't move at all | The extension isn't in the supported list, or the file is inside a subfolder | Only top-level files with recognized extensions are moved |

---

## 15. FAQ

**Q: Does this app copy files or move them?**
A: It **moves** them. The original file no longer exists in its original location.

**Q: Can I undo an organize action?**
A: No, there's no built-in undo. You'd need to manually move files back.

**Q: Can I add my own file categories or extensions?**
A: Not through the UI yet - you'd need to edit the `EXT_MAP` dictionary near the top of `File_Organizer.py`.

**Q: Does this app need internet access?**
A: No, it works entirely offline.

**Q: Will it touch files inside subfolders?**
A: No, it only processes files directly inside the folder you select.

---

## 16. Common Mistakes

- Forgetting to activate the virtual environment before installing packages or running the app.
- Running `pip install` **outside** the virtual environment, which can clutter your system-wide Python installation.
- Pointing the app at an important folder (like `Documents` or `Desktop`) without backing it up first.
- Typing a folder path with extra quotation marks or trailing slashes - prefer the **Browse** button to avoid typos.

---

## 17. Security Recommendations

- **Back up first:** Since files are moved (not copied) and there's no undo, copy important folders elsewhere before organizing them.
- **Don't run on system folders:** Avoid pointing this app at folders like `C:\Windows`, `/System`, or other operating-system directories.
- **Review before bulk use:** Test on a small, disposable folder before running it on anything important.
- **Keep dependencies updated:** Periodically run `pip install --upgrade customtkinter` inside your virtual environment to get security and bug fixes.

---

## 18. Next Learning Steps

Once you're comfortable with this project, here are good next steps:

- Learn Python basics: [https://docs.python.org/3/tutorial/](https://docs.python.org/3/tutorial/)
- Learn more about Tkinter/CustomTkinter GUIs: [https://github.com/TomSchimansky/CustomTkinter](https://github.com/TomSchimansky/CustomTkinter)
- Learn Git basics beyond `clone`: committing, branching, and pull requests - [https://docs.github.com/en/get-started](https://docs.github.com/en/get-started)
- Try adding a feature yourself, such as a confirmation dialog before moving files, or a way to undo the last organize action.
