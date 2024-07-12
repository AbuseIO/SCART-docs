# Cleanup

---

## Automatic background process

Every night the cleanup background job runs to do a checkup from the SCARt environment.
The following actions are done:

1. Recycle of the SCARt application logfile
2. Reset for scraping-again from inputs-open-for-classify and not look at in the past 24 hours
3. Remove cached images that have finished being analyzed
4. Cleanup of the WhoIs cache; removal not active domain and/or IP records
5. Rewind the ICCAM import one day to be sure every ICCAM report is imported
6. Make anonymous if the retention time is met
7. Cleanup "deleted marked records" in the database

## Anonymous 

SCARt can be configured (not standard) to anonymouse privacy related fields. These fields 
include:

- URL
- URL_host
- URL_base
- URL_referer
- URL_IP
- URL_HASH

After the retention time (for example 1 year) the values in the database of these fields 
are overwriten with "anonymouse-[record-id]". 

The status or for example the classification will be kept in the database, so general 
reports without the privacy information can be reported (exported).

The specific retention time has to be configured. Please contact your SCARt contact for 
more information.







 















