#!/bin/bash

# File Organizer - macOS Startup Script
# Double-click this file to set up and launch the app.

cd "$(dirname "$0")"

echo "==================================================================="
echo "  File Organizer - macOS Startup Script (Was made by Oleh Datsyk)"
echo "==================================================================="
echo

# --- Step 1: Check Python is installed ---
echo "[1/5] Checking for Python..."
if command -v python3 >/dev/null 2>&1; then
    PYTHON_CMD="python3"
else
    echo
    echo "[ERROR] Python 3 was not found on this computer."
    echo "Please install it from https://www.python.org/downloads/"
    echo
    read -p "Press Enter to close this window..."
    exit 1
fi
echo "    Python found: $($PYTHON_CMD --version)"
echo

# --- Step 2: Create virtual environment if it doesn't exist ---
echo "[2/5] Checking for virtual environment..."
if [ ! -f "venv/bin/activate" ]; then
    echo "    No virtual environment found. Creating one now..."
    $PYTHON_CMD -m venv venv
    if [ $? -ne 0 ]; then
        echo
        echo "[ERROR] Failed to create the virtual environment."
        read -p "Press Enter to close this window..."
        exit 1
    fi
    echo "    Virtual environment created."
else
    echo "    Virtual environment already exists."
fi
echo

# --- Step 3: Activate virtual environment ---
echo "[3/5] Activating virtual environment..."
source "venv/bin/activate"
if [ $? -ne 0 ]; then
    echo
    echo "[ERROR] Failed to activate the virtual environment."
    read -p "Press Enter to close this window..."
    exit 1
fi
echo "    Virtual environment activated."
echo

# --- Step 4: Install dependencies ---
echo "[4/5] Checking dependencies..."
python -c "import customtkinter" >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "    customtkinter not found. Installing dependencies..."
    if [ -f "requirements.txt" ]; then
        pip install -r requirements.txt
    else
        pip install customtkinter
    fi
    if [ $? -ne 0 ]; then
        echo
        echo "[ERROR] Failed to install dependencies."
        read -p "Press Enter to close this window..."
        exit 1
    fi
    echo "    Dependencies installed."
else
    echo "    Dependencies already satisfied."
fi
echo

# --- Step 5: Check for .env file (informational only, app doesn't currently require one) ---
if [ -f ".env.example" ] && [ ! -f ".env" ]; then
    echo "[INFO] No .env file found. If this app requires configuration,"
    echo "       copy .env.example to .env and fill in the required values."
    echo
fi

# --- Launch the application ---
echo "[5/5] Launching File Organizer..."
echo
python "File_Organizer.py"
STATUS=$?

if [ $STATUS -ne 0 ]; then
    echo
    echo "============================================"
    echo "  The application closed with an error."
    echo "  See the message above for details."
    echo "============================================"
    read -p "Press Enter to close this window..."
    exit 1
fi

echo
echo "Application closed normally."
read -p "Press Enter to close this window..."
