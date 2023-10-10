#!/usr/bin/env nextflow
// A snippet for testing modules and subworkflows

nextflow.enable.dsl=2

include { TEST } from './modules/local/test/main.nf'

workflow {

    TEST()

}
