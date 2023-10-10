process TEST {
    tag "Test"
    label 'process_high'

    publishDir "$baseDir", mode: 'copy'

    output:
        path("*.html")

    when:
        task.ext.when == null || task.ext.when

    script:
        template 'render_notebook.R'
    stub:
        """
        """
}
