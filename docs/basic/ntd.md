# Notice & Take Down

---

Within the NTD function you can find the Notice & Take Down (NTD) messages that 
were sent and the ones which are waiting te be send.

## Sending NTD's

There are a number of moments when SCARt starts a NTD:

- after classify and when the hoster of illegal material is local (country)
- after 24 hours when the illegal content is still online
- when marked as POLICE in classify (ntd to police contact)

After "starting" a NTD, SCARt will group URL's for the same abuse contact until 
the hour-threshold is reached. 

Default hour-thresholds:

- FIRST NTD hoster; 1 hour
- FIRST POLICE; 1 hour
- SEND LEA; 1 hour
- NEXT NTD hoster; 24 hour

Note: these thresholds can be set invidual for each SCARt environment.

Before actual sending a NTD, SCARt will last minute check for each attached URL 
whether the hoster is still the same. If not, the URL will be removed from the 
NTD.

## NTD email template 

NTD are send based on a NTD templatw which can be defined as a general template
in Settings -> NTD template. Which NTD template is used for an abuse contact is
set in Abusecontact under the NTD tab. On this tab also a specific subject and body text
can be set.

Important in the text of the body is the tag-string "{{abuselinks}}". This tag will be
replaced by the connected URLs.

The URLs cvan be included in the body text, the URLs can also be attached in a CSV
attachment.

