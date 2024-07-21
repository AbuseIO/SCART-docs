# ICCAM

---

SCARt can import and export updated reports through the ICCAM API (version 2 and 3). 
For this to work, the ICCAM client certificate, user and password has to be set 
within the SCART config. 

## Importing

SCARt will check every minute for import records waiting in ICCAM. If there are,
these records are imported as report with all content items attached. Any classification 
in ICCAM will be copied to SCARt. If the import was successfull, SCARt will set 
the reference in ICCAM to the SCARt filenumber.

When importing from ICCAM, SCARt will load the images from the content items directly 
without scraping the main URL. So the content will be close to identical as in ICCAM. 

## Exporting

All reports and content items that are imported from ICCAM will also receive an
update (export) when handled within SCARt. This can be the classification, but also actions 
like Content Unavailable and send to ISP or LEA. 

## Errors

Sometimes there are synchronization errors between ICCAM and SCARt. This can be because of 
timing conflicts and/or manual handling of a report in the same timeframe within 
ICCAM and SCARt.

In SCARt under Settings -> "Export errors" logrecords of ICCAM synchronization problems 
can be found. 


