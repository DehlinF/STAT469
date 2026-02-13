# STAT 469 Food Expenditures Report - Setup and Render Script
# Run this script in RStudio to install packages and render your report

# ============================================================================
# STEP 1: Install Required Packages (only needs to be done once)
# ============================================================================

cat("Installing required packages...\n")

# List of required packages
required_packages <- c(
  "tidyverse",    # Data manipulation and visualization
  "nlme",         # GLS models with variance structures
  "car",          # Diagnostic tests
  "knitr",        # RMarkdown rendering
  "kableExtra",   # Table formatting
  "rmarkdown",    # Document rendering
  "tinytex"       # LaTeX for PDF rendering
)

# Install packages that aren't already installed
new_packages <- required_packages[!(required_packages %in% installed.packages()[,"Package"])]
if(length(new_packages)) {
  install.packages(new_packages, dependencies = TRUE)
}

# If you don't have LaTeX installed, uncomment and run the next two lines:
# install.packages("tinytex")
# tinytex::install_tinytex()

cat("Package installation complete!\n\n")

# ============================================================================
# STEP 2: Verify Files Are in Place
# ============================================================================

cat("Checking for required files...\n")

# Check for the data file
if (file.exists("FoodExpenses.txt")) {
  cat("✓ FoodExpenses.txt found\n")
} else {
  cat("✗ FoodExpenses.txt NOT FOUND - Please ensure it's in your working directory\n")
}

# Check for the RMarkdown file
if (file.exists("FoodExpenditure_Report.Rmd")) {
  cat("✓ FoodExpenditure_Report.Rmd found\n")
} else {
  cat("✗ FoodExpenditure_Report.Rmd NOT FOUND - Please ensure it's in your working directory\n")
}

cat("\n")

# ============================================================================
# STEP 3: Render the Report to PDF
# ============================================================================

cat("Rendering report to PDF...\n")
cat("This may take 30-60 seconds...\n\n")

# Render the document
rmarkdown::render(
  "FoodExpenditure_Report.Rmd",
  output_format = "pdf_document",
  output_file = "FoodExpenditure_Report.pdf"
)

cat("\n")
cat("==================================================\n")
cat("SUCCESS! Your report has been generated.\n")
cat("Look for: FoodExpenditure_Report.pdf\n")
cat("==================================================\n")

# Optionally open the PDF (uncomment if you want auto-open)
# system2("open", "FoodExpenditure_Report.pdf")  # Mac
# shell.exec("FoodExpenditure_Report.pdf")        # Windows
