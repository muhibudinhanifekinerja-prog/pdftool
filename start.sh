#!/bin/bash
# PDF Table Extractor Dashboard - Startup Script
# ================================================

echo ""
echo "╔══════════════════════════════════════════════════╗"
echo "║        PDF Table Extractor Dashboard             ║"
echo "║        Multi-method: pdfplumber + camelot        ║"
echo "╚══════════════════════════════════════════════════╝"
echo ""

# Check and install dependencies
echo "📦 Memeriksa dependensi..."
pip install flask pdfplumber camelot-py tabula-py openpyxl pypdf --break-system-packages -q 2>/dev/null
echo "✅ Dependensi siap"
echo ""
echo "🚀 Memulai server..."
echo "📌 Buka browser di: http://localhost:5050"
echo "📋 Tekan Ctrl+C untuk menghentikan server"
echo ""

python3 app.py
