# dbt Labs Internal Analytics
## Our Ecosystem
![Analytics Ecosystem@2x (1)](https://user-images.githubusercontent.com/16456253/192841540-c28334bb-a79e-4016-af46-a9e8e3f7cc4c.png)

## Version Policy
We will update our project to use the beta/latest version of dbt within a week of its release. Please ensure you are always up-to-date with the latest version.

## Getting Started
First, you'll need the following:
- Install the [Client VPN](https://www.notion.so/dbtlabs/VPN-Setup-Guide-e169db2aa0a24bfeb16396f92cadfb20)
- Snowflake credentials - You can ping #tech-support to add our prod Snowflake to your Okta homepage. By logging in via SSO, you will automatically create an account. Please ping #tech-support to ensure that you're granted the `TRANSFORMER` role in Snowflake
- System Prerequisites (if using CLI):
  - [homebrew](https://brew.sh/), [git](https://docs.getdbt.com/dbt-cli/installation/), [dbt](https://docs.getdbt.com/docs/get-started/installation)
- Install `pre-commit` – our framework for running our hooks on every commit to automatically ensure code quality. By pointing these issues out before code review, this allows a code reviewer to focus on the architecture of a change while not wasting time with trivial style nitpicks.
- Clone the repository via SSH:  `git@github.com:dbt-labs/internal-analytics.git`
  - Ensure that you C+P an SSH key from your laptop into [your Github settings](https://github.com/settings/keys)
  - For information on how to generate an SSH key, [reference this article](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent). Note: While generating an SSH key, you will be prompted to enter a passphrase (Step 4 in the article). You can leave this blank to avoid having to enter a passphrase for every git command.

TL;DR - Run the following commands in Terminal:
```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
$ brew install git
$ brew tap dbt-labs/dbt
$ brew install dbt-snowflake
$ brew install pre-commit
  # Ensure you have SSH key generated and placed in Github prior to running the below step
$ git clone git@github.com:dbt-labs/internal-analytics.git
```

### Setting up your developer profile:
- In terminal, navigate to the folder where you cloned the Internal Analytics repo.
- Run the command `dbt init` and follow the prompts. This will ask you to input your Snowflake username (e.g. ERICA.LOUIE) and your development schema (e.g. dbt_elouie). Note: if you already have a `profiles.yml` file in your `.dbt` folder, this will bring up an overwrite prompt. You are free to overwrite your existing `profiles.yml` by entering `Y` and pressing enter.
- Once successful, navigate to your `.dbt` folder and verify the contents of `profiles.yml` looks correct. The output should look like the below:
```
config:
  fail_fast: true
garage-snowflake:
  outputs:
    dev:
      account: kw27752
      authenticator: externalbrowser
      client_session_keep_alive: False
      database: ANALYTICS_DEV
      role: TRANSFORMER
      schema: <your dev schema; e.g. dbt_elouie>
      threads: 8
      type: snowflake
      user: <your snowflake username; e.g. "ERICA.LOUIE">
      warehouse: TRANSFORMING
  target: dev
```

### Running dbt for the first time:
1. [local dev only] run `pre-commit install` to set up the git hook scripts ensuring code quality
2. run `dbt deps` to build package dependencies.
3. run `dbt run-operation reset_dev_env --args '{from_schema: analytics}'` to clone the production database into your development schema.

It's generally good to run these commands occasionally when you haven't updated your dev environment in a while. `deps` should be run if 
you know packages have been updated since you last worked in the project and the `reset_dev_env` should be run if you want the most 
up to date copy of prod data in your development schema.


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
