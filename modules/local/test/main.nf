process TEST {
    tag "Test"
    label 'process_high'

    debug true

    publishDir "$baseDir", mode: 'copy'

    when:
        task.ext.when == null || task.ext.when

    script:
        """
        """

    stub:
        """
        """
}
