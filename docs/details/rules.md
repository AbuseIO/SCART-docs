# Domain rules

---

In SCARt rules can be used to:

- mark an URL domain with "do not scrape"
- associate (forced) an URL domain to a hoster 
- associate (forced) an URL domain to a registrar
- mark an URL domain to send the NTD also to a site owner
- use a proxy service for retreiving the real IP of an URL domain
- classify an URL domain ILLEGAL directly
- classify an URL domain NOT ILLAGAL directly
- connect a link checker from a hoster to an URL domain

Rules can be maintained by the RULES function from the main menu and also within the 
CLASSIFY specific based on the domains of the working reports.  

## Domain specification

The rules will search for patterns in the URL based on the domain specification in 
the rule. 

Note that the "www" is automatically removed before matching. 

Examples:

- example.com; matches https://www.example.com, https://example.com, https://example.com/page
- sub.example.com; matches https://sub.example.com, but NOT https://example.com/
- .onion; matches https://www.example.onion, http://example.onion, https://example2.onion


## Do not scrape RULE

Sometimes you don't want specific URL's to be scraped but to be handled manually. In 
that case you can create this rule. The reports will be available in the INPUTS function 
without being scraped.

## Force hoster or registrar

If the hoster is hidden or the local Whois is not matching the correct hoster and/or 
registrar, you can force SCARt to assign a hoster or registrar based on the domain in 
the URL.

## Send also to site owner

Sometimes a site owner is reacting quicker then the hoster or registrar. You then want to 
send the NTD to this site owner abuse contact as well. 

With this rule you can set the NTD (with abuse URLs) will also be send to the site owner 
in the same frequence as the NTD being send to the hoster.

## Use proxy services

There are two rules important for assigning an IP to a domain based on proxy services.

First there is the "Proxy service API" rule. With this rule you set in SCARt that specific 
abuse contacts have an API to get the real IP from a domain. On this moment this 
service is only provided by CloudFlare. Your organization needs permission and an account 
to use this CloudFlare service. 

Note: you have to share the account information with the SCARt service provider so it can 
be used.

Secondly you can make a "Proxy service owner" rule. With this rule you can force an IP 
to a specific domain. When you set this rule also an Proxy service contact (such as 
Cloudflare), this proxy service is used to automatically get the (real) IP.

## Direct classify

Sometimes the classification can be done automatically based on a domain specification in 
an URL. This can be done with the "Direct classify" rule. SCARt will apply the same 
classification for all URL's under the domain as it has set for the mainurl of the domain.

When an URL matches a Direct classify rule, the classification is set and the report is 
directly set on the check online status. A NTD is send if applicable, also ICCAM actions 
will be executed and the URL is being monitored in the check online status if the hoster 
is found to be local (country). 

## Link checker

Some hosters provide a link checker (API) which can be connect to SCARt for getting the 
online status. In this way the hoster can also remove the illegal URL automatically.   

For each provider the specific API has to be implemented. Please contact your SCARt
(service) provider for more information.
