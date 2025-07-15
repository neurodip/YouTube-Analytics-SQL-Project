#  YouTube Trending Video Analysis Using MySQL

A complete data cleaning and analysis project using the Indian subset of the YouTube Trending Dataset from Kaggle. The goal was to clean, structure, and generate business-level insights using raw, messy CSV and JSON data with SQL.

---

##  Project Objective

- Load and clean raw trending video data from YouTube India.
- Handle missing, incorrect, and duplicate values.
- Convert raw fields (dates, booleans) to usable formats.
- Perform SQL-based analysis to uncover meaningful video and channel insights.

---

##  Tools & Technologies Used

- **Database**: MySQL 8+ (Workbench + CLI)
- **Language**: SQL
- **Data Source**: Kaggle YouTube Trending Dataset
- **Additional Tools**: Excel, Notepad++ (for preprocessing), UTF-8 encoding

---

##  Dataset Overview

| Attribute              | Description                             |
|------------------------|-----------------------------------------|
| video_id               | Unique video identifier                 |
| title                  | Title of the video                      |
| channel_title          | Name of the channel                     |
| category_id            | Numeric category reference              |
| views, likes, dislikes | Engagement metrics                      |
| comment_count          | Number of comments                      |
| publish_time           | Original video publish timestamp        |
| trending_date          | Date when the video was trending        |
| tags, description      | Metadata fields                         |
| comments_disabled      | TRUE/FALSE                              |

-  File Used: `INvideos_utf8.csv` (India only)
-  Original Rows: 37,346
-  Final Cleaned Rows: 37,346

---

##  Data Cleaning Summary

| Step                          | Description |
|-------------------------------|-------------|
|  Null Replacements            | Blank titles, tags, descriptions replaced |
|  Date Formatting              | Converted `trending_date` and `publish_time` |
|  Boolean Mapping              | Converted text fields to TRUE/FALSE flags |
|  Duplicate Removal            | Removed duplicates based on `video_id` and `trending_date` |
|  Category Mapping             | Mapped `category_id` from JSON to human-readable names |
|  Removed Invalid Records      | Deleted rows with zero views, likes, comments |

---

##  Key Analysis Performed

- Top 10 most viewed videos in India
- Most liked videos and channels
- Engagement rate = (likes / views) × 100
- Category-wise average views
- Monthly trend of trending videos
- Videos with most comments and dislikes
- Top channels by number of trending appearances

---

##  Insights Highlights

-  **Most viewed videos** were music videos and movie trailers.
-  **T-Series**, **Marval Entertainment**, and **FoxStarHindi** dominated total views.
-  **Highest engagement** observed on fan-made or niche content.
-  Most trending activity was observed between **Nov 2017 to mid-2018**.
-  Controversial videos attracted the most comments and dislikes.

---

##  SQL Files Structure
**YouTubeSQLProject/**
|── README.md
├── data/
│   └── INvideos_utf8.csv
├── sql/
│   ├── create_tables.sql
│   ├── cleaning_steps.sql
│   └── analysis_queries.sql
├── report/
│   ├── youtube_analysis_report.pdf 

