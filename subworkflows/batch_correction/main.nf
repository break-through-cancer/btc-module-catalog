#!/usr/bin/env nextflow
// Ideas for refactoring code and incorporating python

nextflow.enable.dsl=2
input_method = 'all'

include { SCBTC_HANDLING_PYTHON              } from './modules/local/convert'
include { SCBTC_PYTHON_INTEGRATION as scanpy } from './modules/local/python_integration'
include { SCBTC_INTEGRATION as Harmony       } from './modules/local/integration'
include { SCBTC_INTEGRATION as Harmony       } from './modules/local/integration'
include { SCBTC_INTEGRATION as FastMNN       } from './modules/local/integration'
include { SCBTC_INTEGRATION as RPCA          } from './modules/local/integration'
include { SCBTC_INTEGRATION as RPCA          } from './modules/local/integration'

workflow BATCH CORRECTION {

    // Regular
    // --skip_integration_method Harmony,CCA

    Harmony(
        SEURAT_OBJECT,
        method = 'harmony'
    )

    FastMNN(
        SEURAT_OBJECT,
        method = 'mnn'
    )

    ...

    SCBTC_HANDLING_PYTHON(
        SEURAT_OBJECT
    )

    scanpy(
        SCBTC_HANDLING_PYTHON.out,
        method = 'scanpy'
    )

}
