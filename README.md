
> THIS REPOSITORY IS A SHAMELESS AND SIMPLIFIED COPY OF NF-CORE MODULES. THEREFORE, IT IS UNDER ACTIVE DEVELOPMENT. 

A repository for hosting [Nextflow DSL2](https://www.nextflow.io/docs/latest/dsl2.html) module files containing tool-specific process definitions and their associated documentation.

## Table of contents

Coming soon.

## Using existing modules

The module files hosted in this repository define a set of processes for software tools such as `fastqc`, `bwa`, `samtools` etc. This allows you to share and add common functionality across multiple pipelines in a modular fashion.

We have written a helper command in the `nf-core/tools` package that uses the GitHub API to obtain the relevant information for the module files present in the [`modules/`](modules/) directory of this repository. This includes using `git` commit hashes to track changes for reproducibility purposes, and to download and install all of the relevant module files.

1. Install the latest version of [`nf-core/tools`](https://github.com/nf-core/tools#installation) (`>=2.0`)
2. List the available modules:

   ```console
   $ nf-core modules list remote

                                         ,--./,-.
         ___     __   __   __   ___     /,-._.--~\
   |\ | |__  __ /  ` /  \ |__) |__         }  {
   | \| |       \__, \__/ |  \ |___     \`-._,-`-,
                                         `._,._,'

   nf-core/tools version 2.0

   INFO     Modules available from nf-core/modules (master):                       pipeline_modules.py:164

   ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
   ┃ Module Name                    ┃
   ┡━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
   │ bandage/image                  │
   │ bcftools/consensus             │
   │ bcftools/filter                │
   │ bcftools/isec                  │
   ..truncated..
   ```

3. Install the module in your pipeline directory:

   ```console
   $ nf-core modules install fastqc

                                         ,--./,-.
         ___     __   __   __   ___     /,-._.--~\
   |\ | |__  __ /  ` /  \ |__) |__         }  {
   | \| |       \__, \__/ |  \ |___     \`-._,-`-,
                                         `._,._,'

   nf-core/tools version 2.0

   INFO     Installing fastqc                                                      pipeline_modules.py:213
   INFO     Downloaded 3 files to ./modules/nf-core/modules/fastqc                 pipeline_modules.py:236
   ```

4. Import the module in your Nextflow script:

   ```nextflow
   #!/usr/bin/env nextflow

   nextflow.enable.dsl = 2

   include { FASTQC } from './modules/nf-core/modules/fastqc/main'
   ```

5. Remove the module from the pipeline repository if required:

   ```console
   $ nf-core modules remove fastqc

                                         ,--./,-.
         ___     __   __   __   ___     /,-._.--~\
   |\ | |__  __ /  ` /  \ |__) |__         }  {
   | \| |       \__, \__/ |  \ |___     \`-._,-`-,
                                         `._,._,'

   nf-core/tools version 2.0

   INFO     Removing fastqc                                                        pipeline_modules.py:271
   INFO     Successfully removed fastqc                                            pipeline_modules.py:285
   ```

6. Check that a locally installed nf-core module is up-to-date compared to the one hosted in this repo:

   ```console
   $ nf-core modules lint fastqc

                                         ,--./,-.
         ___     __   __   __   ___     /,-._.--~\
   |\ | |__  __ /  ` /  \ |__) |__         }  {
   | \| |       \__, \__/ |  \ |___     \`-._,-`-,
                                         `._,._,'

   nf-core/tools version 2.0

   INFO     Linting pipeline: .                                                    lint.py:104
   INFO     Linting module: fastqc                                                 lint.py:106

   ╭─────────────────────────────────────────────────────────────────────────────────╮
   │ [!] 1 Test Warning                                                              │
   ╰─────────────────────────────────────────────────────────────────────────────────╯
   ╭──────────────┬───────────────────────────────┬──────────────────────────────────╮
   │ Module name  │ Test message                  │ File path                        │
   ├──────────────┼───────────────────────────────┼──────────────────────────────────┤
   │ fastqc       │ Local copy of module outdated │ modules/nf-core/modules/fastqc/  │
   ╰──────────────┴────────────────────────────── ┴──────────────────────────────────╯
   ╭──────────────────────╮
   │ LINT RESULTS SUMMARY │
   ├──────────────────────┤
   │ [✔]  15 Tests Passed │
   │ [!]   1 Test Warning │
   │ [✗]   0 Test Failed  │
   ╰──────────────────────╯
   ```

## Adding new modules

If you wish to contribute a new module, please see the documentation on the [nf-core website](https://nf-co.re/developers/modules#writing-a-new-module-reference).

> Please be kind to our code reviewers and submit one pull request per module :)

