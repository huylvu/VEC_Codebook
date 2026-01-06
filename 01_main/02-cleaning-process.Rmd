# Cleaning Process {#cleaning}

## Overview {#cleaning-overview}

This cleaning workflow is built for a dataset that spans 2000–2021, so it must handle many shifts over time: industry codes (VSIC 2008 → 2018), legal definitions of enterprise types, inconsistent variable names and option sets across years, unit changes (VND, thousand VND, million VND), and variables that appear only in certain years. The workflow therefore focuses on standardizing and harmonizing these differences before downstream cleaning and analysis.

## Get started {#get-started}

### Folder organization

*[Mô tả cấu trúc thư mục cho quy trình cleaning]*

```r
# Example folder structure
# 00_archived/  - Archived files
# 01_dofiles/   - Cleaning code
# 02_raw/       - Raw datasets
# 03_temp/      - Temporary files
# 04_clean/     - Cleaned datasets
# 05_codebook/  - Documentation
```

### Setting up the environment

*[Hướng dẫn setup môi trường làm việc]*

```r
# Example setup code
# Set working directory
# Load required packages
# Define global variables
```

## Common data issues {#data-issues}

One of the most structured and usable ways to handle the issues above is to build detailed codebooks and data dictionaries for each year, then merge them into a multi-year codebook that harmonizes the data for cleaning and analysis. The dataset also includes multiple questionnaires, so processing everything is time-intensive.

The cleaning workflow for Questionnaire 01 (general enterprise information) focuses on:

- Defining and selecting the core variables needed for general enterprise information.
- Compiling, extracting, and creating codebooks/data dictionaries by year and multi-year, based on questionnaires and raw data, ensuring coverage for the selected variables.
- Writing code to harmonize the data: standardize variable names, labels, and values across years.
- Addressing remaining issues such as crosswalks for enterprise addresses, enterprise types, and industry codes (VSIC 2008/2018).

### Core variables needed

Variables are organised into blocks that mirror the content structure of Questionnaire 01:

| Content block (Questionnaire 01) | Typical components |
|:---------------------------------|:-------------------|
| **Identification & location** | Tax identification number<br>Enterprise code<br>Province/District/Commune<br>Detailed address<br>Ownership type<br>VSIC industry |
| **General information** | Year of establishment<br>Operating status<br>Location inside/outside industrial or economic zones<br>Type of zone<br>Main and secondary economic activities |
| **Employment & labour costs** | Employment at the beginning and end of the year<br>Female employees<br>Total wage bill, social insurance contributions, and other labour-related expenses |
| **Production and business results** | Turnover/net revenue<br>Cost of goods sold<br>Profit before tax<br>Corporate income tax |
| **Assets and liabilities** | Total assets at the beginning and end of the year<br>Current and non-current assets<br>Fixed assets (at historical cost) and depreciation<br>Work-in-progress construction<br>Total liabilities<br>Owners’ equity |
| **Taxes and budget payments** | Other payments to the State budget, as specified in the questionnaire |
| **External trade and technology** | Export and import status<br>Relevant international trade activities and technology-related information |

### Inconsistent variable names

Variable names for each year will have a different name, but the content is the same. So we need to harmonize the variable names across years to ensure consistency and convenience for cleaning and analysis. For example, the variable name for "Province location of establishment" is tinh, matinh_d, MaTinh_Dieutra, matinh_dieutra for 2018, 2019, 2020, 2021 - 4 different variable names for the same content.

| Variable Name | 2018 | 2019 | 2020 | 2021 |
|:--------------|:------|:-----|:-------|:------------|
| ma tinh | tinh | matinh_d | MaTinh_Dieutra | matinh_dieutra |

### Variables containing inconsistent values

In many cases, the value labels for categorical variables change over survey waves. 

For example, the coding for type of enterprise or sector of enterprise may differ between survey waves. For example, the coding for "Type of enterprise" is 1-8 before the 2020, but after the 2020, it is 1-7 because there is no option for "4" (state Enterprise) after the 2020. With the sector of each enterprise, there are two main classification base on the VSIC 2008 and VSIC 2018, so we need to harmonize the value labels for the sector of each enterprise across years.

For some special issues that should be considered such as: for some years, the currency unit is changed from VND to thousand VND or million VND, or the question is changed like from 2020, it combine 2 question "your firm have export activities" and "your firm have import activities" into 1 question "your firm have export and import activities", so that, we cannot define what exactly type of international trade activities the enterprise has.

Our cleaning process will focus mostly on these issues, other issues for data cleaning like missing values, duplicate records, outliers, etc. will be handled but not the main focus.

## Cleaning steps {#cleaning-steps}

### Step 1: Constructing codebooks and data dictionaries

Codebooks and data dictionaries are the foundation of the cleaning process. They provide the mapping of variable names, value labels, and other metadata across years. The codebooks and data dictionaries are constructed based on the questionnaires and raw data.

For each year, we will construct a codebook and data dictionary that contains the variable names, value labels, and other metadata. The codebook and data dictionary are constructed based on the questionnaires and raw data. The most convinient way is to use a package from Stata, called iecodebook that developed by The world bank team. You can find the package [here](https://github.com/worldbank/iecodebook).

```stata
* ---------------------------------------------------------------------------
**# 0. CREATE CODEBOOK
* ---------------------------------------------------------------------------
foreach y of local years {
	* Create codebook following World Bank standard
	cap iecodebook template using "$codebook/codebook_`y'.xlsx", replace
}
```
However, the iecodebook package is not very flexible and it is not easy to use for our dataset because of the messsy of the raw dataset, it is not easy to identify the variable names and value labels for each year. So we decide use our own master codebook and develop a custom package for handling that kind of codebook.

Our codebook is a Google Sheets file that contains the variable names, value labels, and other metadata across years. You can find the codebook [here](https://docs.google.com/spreadsheets/d/1z1FoluAF2u6vSx7LM_uHxjLDjmr7d3JHDB1zvJiu-cs/edit?gid=0#gid=0). The codebook is updated regularly to ensure the latest information. The structure of the codebook is as follows:

| Citeria | Code | Code_name | label | code_2016 | code_2017 | code_2018 | code_2019 | code_2020 | code_2021 | code_2022 | Note |
|:--------|:-----|:----------|:------|:----------|:----------|:----------|:----------|:----------|:----------|:----------|:----------|:-----|
| Địa chỉ tỉnh | a1 | tinh | Province Address | tinh | tinh | tinh | matinh_d | MaTinh_Dieutra | matinh_dieutra | MaTinh_Dieutra | |

### Step 2: Variable standardization


### Step 3: Data validation


### Step 4: Data transformation


### Step 5: Final checks


