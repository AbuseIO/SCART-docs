# Import 

---

SCARt has several ways for importing reports:

- Manual input
- ICCAM (Inhope)
- By uploading 
- By email



## Manual input

In the INPUTS function you can use CREATE to manual add an input. Required is a
valid url, workuser, source and type. Default this input will set on the  scrape
status so the input (URL) will automatically picked up by the SCARt background
process to analyze and scrape.

## ICCAM

SCARt supports ICCAM API version v2 and v3. 

The main difference With version v3 and v2 is that in v3 the synchronization is done 
on a much directer one-to-one level between SCARt and ICCAM.

System admin has to configure:
- ICCAM certificate (one time each year)
- ICCAM API user and password

## By upload

In the SCARt functionm INPUTS you can import a CSV file with on every line:

`
URL;REFERER;WORKUSER-EMAIL;REFERENCE;SOURCE;TYPE
`

Note: URL is **required**, the other fields are optional.

## By email

SCARt can read a mailbox to receive webform input. The admin has to configure 
the mailbox account. After this, all email in this mailbox will automatically 
process by SCART.

Note that for protecting reasons, a whitelist access policy is setup. Within SCARt 
the admin can put sender email address on the whitelist (SETTINGS -> WHITE LIST). 
Is a sender from an email not on this list then the import email will not be accepted.

### Email import of reports

You can send an email with as subject "SCART-INPUT" to the mailbox. Each line can 
hold:

`
URL;REFERER;NOTE
`

Note: 

1. URL is **required**, the other fields are optional.
2. The system admin can set if the status is set on OPEN or SCRAPE


### Email import with source specification 

You can send an email with as subject "SCART-INPUT-SOURCE [source]" to the mailbox 
with "[source]" replaced with the source you want to be set. if the source is not 
found in SCARt, then the source is automatically added.

The body format is the same as above (including the note).

### Email import Content Removed

You can send an email with as subject "SCART-CONTENTREMOVED" to the mailbox. Each 
line can hold the url of the report in SCARt to be set on CLOSE, including 
sending to ICCAM the CR action.

### Email import Content Unavailable 

You can send an email with as subject "SCART-CONTENTUNAVAILABLE" to the mailbox. Each
line can hold the url of the report in SCARt to be set on CLOSE, including
sending to ICCAM the CU action.

### Custom webform email import

A special function is made for importing special webform data, including importing 
data without an url. 

See [custom webforms](../details/custom_webforms.md) for more information.


