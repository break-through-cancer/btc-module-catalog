process SCBTC_INTEGRATION {
    tag "Batch correction"
    label 'process_high'

    container "oandrefonseca/scrpackages:main"
    publishDir "${params.outdir}/${params.project_name}", mode: 'copy'

    input:
        path(project_object)
        path(batch_script)
        val(input_batch_step)

    output:
        path("data/${params.project_name}_${input_batch_step}_batch_object.RDS"), emit: project_rds
        path("${params.project_name}_${input_batch_step}_batch_report.html")
        path("figures/integration")

    when:
        task.ext.when == null || task.ext.when
        
    script:
        def n_memory = task.memory.toString().replaceAll(/[^0-9]/, '') as int
        """
        #!/usr/bin/env Rscript

        # Getting run work directory
        here <- getwd()

        # Rendering Rmarkdown script
        rmarkdown::render("${batch_script}",
            params = list(
                project_name = "${params.project_name}",
                project_object = "${project_object}",
                input_target_variables = "${params.input_target_variables}",
                input_integration_method = "${params.input_integration_method}",
                input_batch_step = "${input_batch_step}",
                n_threads = ${task.cpus},
                n_memory = ${n_memory},
                workdir = here
            ), 
            output_dir = here,
            output_file = "${params.project_name}_${input_batch_step}_batch_report.html")           

        """
    stub:
        """
        mkdir -p data figures/integration

        touch data/${params.project_name}_${input_batch_step}_batch_object.RDS
        touch ${params.project_name}_${input_batch_step}_batch_report.html

        touch figures/integration/EMPTY
        """
}
