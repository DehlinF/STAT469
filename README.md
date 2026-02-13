# STAT 469 Food Expenditures Consulting Report

## Quick Start Guide

### Files Included
1. **FoodExpenditure_Report.Rmd** - Main RMarkdown report file
2. **FoodExpenses.txt** - Dataset
3. **setup_and_render.R** - Helper script to install packages and render

### How to Generate Your PDF Report

#### Option 1: Quick Render (Easiest)
1. Open RStudio
2. Set your working directory to where these files are located:
   ```r
   setwd("path/to/your/files")
   ```
3. Open `setup_and_render.R` and click "Source" (or press Ctrl/Cmd + Shift + S)
4. Wait 30-60 seconds for the PDF to generate
5. Open `FoodExpenditure_Report.pdf`

#### Option 2: Manual Render
1. Open RStudio
2. Open `FoodExpenditure_Report.Rmd`
3. Click the "Knit" button (or press Ctrl/Cmd + Shift + K)
4. If prompted to install packages, click "Yes"

#### Option 3: Console Command
```r
rmarkdown::render("FoodExpenditure_Report.Rmd")
```

### First-Time Setup

If this is your first time rendering to PDF, you'll need LaTeX:
```r
install.packages("tinytex")
tinytex::install_tinytex()
```

### Troubleshooting

**Problem:** "Package X not found"
**Solution:** Install missing packages:
```r
install.packages(c("tidyverse", "nlme", "car", "knitr", "kableExtra"))
```

**Problem:** "LaTeX Error"
**Solution:** Install tinytex as shown above

**Problem:** "FoodExpenses.txt not found"
**Solution:** Make sure the data file is in the same directory as the .Rmd file

### Customizing the Report

The RMarkdown file is fully editable. You can:
- Modify the analysis in R code chunks (enclosed in \`\`\`{r} ... \`\`\`)
- Edit the text and conclusions
- Add or remove sections
- Adjust figure sizes in the YAML header
- Change formatting options

Key sections in the .Rmd file:
- Lines 1-18: YAML header (controls PDF formatting)
- Lines 20-30: Setup chunk (loads packages)
- Lines 32-40: Data loading
- After that: Report sections with analysis and text

### What the Report Includes

1. **Introduction** - Project overview and objectives
2. **Main Conclusions** - Key findings about income-spending relationship, economic health assessment, 5-year projections
3. **Modeling Details** - Why standard regression fails, the advanced GLS model with variance function, validation checks
4. **Technical Appendix** - Full model outputs and data summaries

### Key Features of the Analysis

- Comprehensive exploratory analysis with visualizations
- Diagnostic plots showing heteroscedasticity in standard regression
- Advanced Generalized Least Squares (GLS) model with power variance function
- Formal statistical tests (Breusch-Pagan)
- Model validation with standardized residuals
- Economic health assessment vs. $0.50 threshold
- 5-year projections with 3.5% annual income growth
- Professional formatting with tables and figures

### Advanced Customization

**To change the confidence level (default is 95%):**
Find line with `1.96 * slope_se` and change 1.96 to desired z-value

**To modify growth rate (default is 3.5%):**
Find line with `growth_factor <- 1.035^5` and adjust the rate

**To add more income levels for projections:**
Find `income_levels <- c(40, 70, 100, 130)` and add values

### Report Output

- **Format:** PDF with professional formatting
- **Length:** ~12-15 pages
- **Features:** Table of contents, numbered sections, embedded figures and tables
- **Style:** Suitable for presentation to financial advisers

### Need Help?

If you encounter issues:
1. Check that all three files are in the same directory
2. Verify R packages are installed
3. Ensure your RStudio is up to date
4. Try restarting RStudio if rendering fails

For LaTeX/PDF issues specifically, try:
```r
tinytex::reinstall_tinytex()
```

---
**Author:** David Fehlen  
**Course:** STAT 469 - Analysis of Correlated Data  
**Project:** Food Expenditures Consulting
