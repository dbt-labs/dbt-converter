{% docs src_harvest %}
**Status:** Active

The Pro-Serv team uses Harvest to track time spent on a client's project. The ability to track hours gives the team insight into their actual bandwidth vs scheduled hours. This allows the team to continuously make continuous readjustments to time tracking. We track their hours and attribute them to their sprints, which we track using Asana. Read more on how the Professional Services Team uses Harvest in [this Notion doc](https://www.notion.so/dbtlabs/How-We-Use-Harvest-62f9dbcffd3247908f70a7567dac1e77).

This integration is is updated once per day at 12:30am ET via Stitch. To read more about the API and the schema of the tables, please check out [Stitch's Harvest V2 docs](https://www.stitchdata.com/docs/integrations/saas/harvest#schema).

NOTE: This connector does not take hard deletes into the mix. If we delete a project/client/etc, we will have to filter the identifier.

{% enddocs %}