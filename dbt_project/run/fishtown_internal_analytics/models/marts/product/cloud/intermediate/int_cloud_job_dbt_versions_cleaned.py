
  
    
# imports required for any packages that aren’t part of the standard python library
import re
import pandas

def model(dbt, session):

    dbt.config(
        materialized='table',
        packages = ["regex", "pandas"]
    )

    # Pulling in the source
    job_definitions = dbt.ref("int_cloud_job_version_enriched").to_pandas()

    # This regex variable is defined to recognize a number of indiscriminate digits
    _NUM_NO_LEADING_ZEROS = r"(0|[1-9]\d*)"

    # This regex takes the numerical regex above and repeats it with "." 
    # to get at our common version syntax. The "?" allows the second two numbers
    # to be optional, which is a common pattern. 
    # We also know of cases where major version of 0 is omitted, which is
    # dealt with in a later function
    _BASE_VERSION_REGEX = r"""
    (?P<major>{num_no_leading_zeros})\.?
    (?P<minor>{num_no_leading_zeros})\.?
    (?P<patch>{num_no_leading_zeros}?)
    """.format(
        num_no_leading_zeros=_NUM_NO_LEADING_ZEROS
    )

    # This returns the final regex object we're looking for 
    # (i.e. our full version string inputs)
    _VERSION_REGEX = re.compile(_BASE_VERSION_REGEX, re.VERBOSE)

    # This function "version_to_tuple" uses the regex above to pull the version 
    # components into a tuple. If the match is unsuccessful, we feed it (0,0,0) 
    # as the current use-case for versions is to identify latest version
    def version_to_tuple(dbt_version_raw):
        match_result = re.match(_VERSION_REGEX, dbt_version_raw)
        if match_result:
            # if a match is found but the first component is over 15, we feel
            # confident (for now) that it was intended to be major release 0
            if int(match_result.group('major'))>15:  
                version_tuple = tuple("0") + match_result.group('major','minor')
            else:
                version_tuple = match_result.group('major','minor','patch')
        else:
            version_tuple = ("0","0","0")
        return version_tuple

    # stripping distinct dbt_versions from the source table 
    versions = job_definitions[['DBT_VERSION_RUN']].copy().drop_duplicates()

    # prepping the table for regex processing
    versions['DBT_VERSION_RUN'] = versions['DBT_VERSION_RUN'].apply(str)

    # Adding a column with the version tuple
    versions['DBT_VERSION_TUPLE'] = versions['DBT_VERSION_RUN'].apply(version_to_tuple)

    # Adding distinct columns for each component of the version
    versions[['MAJOR','MINOR','PATCH']] = versions['DBT_VERSION_TUPLE'].tolist()

    # Cleaning up blank version component fields (mainly patch)
    versions = versions.replace('', '0')

    # Creating a cleaned-up dbt version
    versions['DBT_VERSION_CLEANED'] = versions['MAJOR'].astype(str)+'.'+versions['MINOR'].astype(str)+'.'+versions['PATCH'].astype(str)

    # This is just a final call.
    return versions


# This part is user provided model code
# you will need to copy the next section to run the code
# COMMAND ----------
# this part is dbt logic for get ref work, do not modify

def ref(*args,dbt_load_df_function):
    refs = {"int_cloud_job_version_enriched": "analytics_dev.dbt_jstein.int_cloud_job_version_enriched"}
    key = ".".join(args)
    return dbt_load_df_function(refs[key])


def source(*args, dbt_load_df_function):
    sources = {}
    key = ".".join(args)
    return dbt_load_df_function(sources[key])


config_dict = {}


class config:
    def __init__(self, *args, **kwargs):
        pass

    @staticmethod
    def get(key, default=None):
        return config_dict.get(key, default)

class this:
    """dbt.this() or dbt.this.identifier"""
    database = 'analytics_dev'
    schema = 'dbt_jstein'
    identifier = 'int_cloud_job_dbt_versions_cleaned'
    def __repr__(self):
        return 'analytics_dev.dbt_jstein.int_cloud_job_dbt_versions_cleaned'


class dbtObj:
    def __init__(self, load_df_function) -> None:
        self.source = lambda *args: source(*args, dbt_load_df_function=load_df_function)
        self.ref = lambda *args: ref(*args, dbt_load_df_function=load_df_function)
        self.config = config
        self.this = this()
        self.is_incremental = False

# COMMAND ----------

# To run this in snowsight, you need to select entry point to be main
# And you may have to modify the return type to text to get the result back
# def main(session):
#     dbt = dbtObj(session.table)
#     df = model(dbt, session)
#     return df.collect()

# to run this in local notebook, you need to create a session following examples https://github.com/Snowflake-Labs/sfguide-getting-started-snowpark-python
# then you can do the following to run model
# dbt = dbtObj(session.table)
# df = model(dbt, session)


def materialize(session, df, target_relation):
    # make sure pandas exists
    import importlib.util
    package_name = 'pandas'
    if importlib.util.find_spec(package_name):
        import pandas
        if isinstance(df, pandas.core.frame.DataFrame):
          # session.write_pandas does not have overwrite function
          df = session.createDataFrame(df)
    df.write.mode("overwrite").save_as_table("analytics_dev.dbt_jstein.int_cloud_job_dbt_versions_cleaned", create_temp_table=False)

def main(session):
    dbt = dbtObj(session.table)
    df = model(dbt, session)
    materialize(session, df, dbt.this)
    return "OK"

  