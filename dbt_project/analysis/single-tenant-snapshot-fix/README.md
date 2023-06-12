## Incident related to automating single-tenant sources in internal-analytics

On Feb 11, 2022 we pushed a change that made it possible for single-tenant data
sources to be automatically added without having to define new sources. The PR
was (#726)[https://github.com/dbt-labs/internal-analytics/pull/726]. The issue
was that the field `_dbt_source_relation` changed from being lower case to now
being upper case. This is a field that we rely on for hashing the single-tenant
IDs in order to guarantee uniqeness. The md5 hash is case sensitive so this
resulted in new IDs being generated. This resulted in our snapshots becoming
unreliable and suffered minor data corruption because the `uniqe_id` that the
table relied on was now different.

## Resolution

We shipped a fix on Feb 14, 2020 with 
(PR #744)[https://github.com/dbt-labs/internal-analytics/pull/744]. However,
this fix would only work if we also corrected the snapshot tables that could not 
be automatically rebuilt. The approach to fixing the snapshot tables was the ff:

- Build a copy of the snapshot table in another schema that re-hashes the IDs
  using `lower()`. Use `row_number()` to order each unique entry and take the
  latest update for every `unique_id` and `timestamp` combination to deduplicate
  the problematic date when the IDs changed.
- Validate the new table with tests and see if it runs successfully with 
  immediate downstream models.
- Create a backup of the old (corrupted) snapshots table, in the event where we
  might have to fallback or re-do the fix.
- Move the copied and deduplicated snapshots table into the place of the old one
  with the same name so that the dbt job can pick it up on the next run.
- Try running `dbt snapshot` locally to validate that it ran successfully.

These were ran as manual DDL statements because this is a one time process and 
would be harder to automate/build into the dbt project. The scripts are all 
documented in this folder's sql files.

**NOTE:** While these scripts will likely run completely and is built in an
idempotent way, we should *not* be running these scripts again! These are meant
to serve as documentation for how a data incident was resolved and as refercence
for a future time when a similar incident may occur.