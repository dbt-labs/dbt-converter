
-- Note: These are regex strings. Always employ \\ for escape sequences like \s and \d.

{%- macro unquoted_frequent_pronoun_pairs() -%}
    he/him|she/her|they/them|he/they|she/they
{%- endmacro -%}

{%- macro frequent_pronoun_pairs() -%}
    '({{unquoted_frequent_pronoun_pairs()}})'
{%- endmacro -%}

-- take any string that isn't a nominative/accusative pair
{%- macro no_pronoun_pairs() -%}
    '\\(([^/]*)\\)'
{%- endmacro -%}

-- select the total string after @, at, |, or - (order matters) until an optional parenthesis
{%- macro at_company() -%}
    '(@|(at )|\\||- |for )\\s*(.+)'
{%- endmacro -%}

-- replace every \ with \\ to perserve behavior in jinja calls
{%- macro escape_regex(regex) -%}
    regexp_replace('\'{{ regex }}'\', '\\\\', '\\\\\\\\')
{%- endmacro -%}
