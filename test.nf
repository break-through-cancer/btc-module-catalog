#!/usr/bin/env nextflow

nextflow.enable.dsl=2

include { TEST } from './modules/local/test'

workflow {

    TEST()

}
