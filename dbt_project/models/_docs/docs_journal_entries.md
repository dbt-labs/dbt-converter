{% docs journal_entry_account %}
The account being debited from or credited to via the transaction.
{% enddocs %}

{% docs journal_entry_amount %}
The amount being debited from or credited to the account. This may be indicated by an adjacent entry_type field
or the name of this field may indicate the accounting entry type. 
{% enddocs %}

{% docs journal_entry_date %}
The date at which the financial event occurs, triggering the journal entry.
{% enddocs %}

{% docs journal_entry_type %}
An entry type is an indicator of whether an entry is a credit or a debit. These concepts are complex and notably different from the same terms
used in a personal finance context. See additional material [here](https://courses.lumenlearning.com/wm-financialaccounting/chapter/rules-of-debits-and-credits/),
though a comprehensive understanding of the concepts is not required. For our internal accounting purposes, the entry type is 
already provided via fields being labelled as <entry>_credit and <entry>_debit indicating which accounts should be debited 
or credited in a transaction. 
{% enddocs %}

{% docs process_group %}
A grouping field to collect journal entries according to the accounting process they represent. 
{% enddocs %}