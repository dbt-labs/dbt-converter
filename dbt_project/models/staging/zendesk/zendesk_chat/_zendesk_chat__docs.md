{% docs src_zendesk_chat %}
**Status:** Active

We started using Zendesk on May 21 2021 (05/21/2021). For all prior support tickets/chat history, please refer to the Intercom source docs.

This source is specifically for Zendesk chat messages and general chat information. These tables allow us to grab every chat message, requester, assignee, and Zendesk ticket_id. We use this source because the Zendesk tickets do not include chat messages, which we need for grabbing our SLA response metric. We can connect these chat messages to their associated tickets found in the Zendesk tables.

To understand how all of these tables connect together, please checkout [Fivetran's Zendesk Chat ERD](https://docs.google.com/presentation/d/1clhWzmL80-6RdfYcNJfwLnakQIvPNvlznOnlSQCbfQg/edit). For general Zendesk Support data (e.g. Ticket information, email exchanges, and ticket status changes), check out the tables found in the Zendesk source ([see Fivetran's Zendesk Support ERD](https://docs.google.com/presentation/d/1rLhChw8DQxThYUdak0Bq2-qoaKBzwIM0t6JUT6g6EOU/edit)).
{% enddocs %}