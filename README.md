# Newspapers Scraping & Text Analysis

This project collects publicly available Iranian newspapers from [pishkhan.com](https://www.pishkhan.com), extracts text from PDFs using OCR when necessary, and searches for keywords like "corona" or "gasoline" to see how often they were mentioned over time.

---

## What the project does

- Downloads newspaper PDFs automatically using Selenium
- Extracts text from PDFs, including OCR for scanned images
- Saves text files for each newspaper and date
- Counts occurrences of specific keywords
- Outputs the results in CSV files for further analysis

---
```
## Project structure
Newspapers_Scraping/
├── Web-scraping to collect publicly available newspaper # Downloads PDFs from the website
├── Convert the files to text data using OCR when necessary # Converts PDFs to text with OCR support
├── Text analysis: word counts # Counts keywords in text files
├── Text/ # Folder containing extracted text files
├── covid.csv # Keyword count results
└── README.md
```

---

## Setup

Install required Python packages:

```bash
pip install selenium pytesseract pymupdf pillow numpy pandas
```
Also make sure:

Tesseract OCR is installed and added to your system PATH

Google Chrome and matching ChromeDriver are installed

## How to run
Run "Web-scraping to collect publicly available newspaper" to download PDFs

Run "Convert the files to text data using OCR when necessary" to convert PDFs to text (OCR if needed)

Run "Text analysis: word counts" to analyze keywords and save results

## Keywords tracked
COVID-related: کووید

Gasoline-related: بنزین

Newspapers included
JaameJam, Javan, KayhanNews, Etemaad, TejaratOnline, Iran, khorasannews, Shahrvand

#### Author: Zahra Shamlou
