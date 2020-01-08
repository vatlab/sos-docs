var images=["banner_keybaord.png","banner_screen.jpg"]
var guides= [
    {
        header: 2,
        title: "SoS Notebook"
    }, 
    {
        header: 3,
        title: "Using SoS Notebook "
    },
    
    {
        title: "Using multiple kernels in one Jupyter noetbook",
        name: "multi_kernel_notebook"
    },
    {
        title: "Working with arbitrary subkernels",
        name: "expand_capture_render"
    },
    {
        title: "Exchanging data among kernels",
        name: "exchange_variable"
    },
    {
        title: "Using the console panel",
        name: "console_panel"
    },
    {
        title: "Previewing variables and files",
        name: "magic_preview"
    },
    {
        title: "Tracking session and revision history of notebooks",
        name: "sessioninfo_revision"
    },
    {
        title: "Running cell in modified environments",
        name: "magic_env"
    },
    {
        title: "Converting RMarkdown files to SoS notebooks",
        name: "rmd_to_ipynb"
    },
    {
        title: "Exporting reports in HTML format",
        name: "magic_convert"
    },
    {
        title: "More on magic <code>%use</code>",
        name: "magic_use"
    },
    {
        title: "Workflow-execution magics",
        name: "workflow_magics"
    },
    {
        header: 3,
        title: "Supported languages "
    },
    
    {
        title: "Working with Bash",
        name: "sos_bash"
    },
    {
        title: "Working with JavaScript and TypeScript",
        name: "sos_javascript"
    },
    {
        title: "Working with Julia",
        name: "sos_julia"
    },
    {
        title: "Working with Matlab and Octave",
        name: "sos_matlab"
    },
    {
        title: "Working with Ruby",
        name: "sos_ruby"
    },
    {
        title: "Working with Python 2 and Python3",
        name: "sos_python"
    },
    {
        title: "Working with R",
        name: "sos_r"
    },
    {
        title: "Working with SAS",
        name: "sos_sas"
    },
    {
        title: "Working with Stata",
        name: "sos_stata"
    },
    {
        title: "Uisng the markdown kernel",
        name: "markdown_kernel"
    },
    {
        header: 3,
        title: "Technical details"
    },
    
    {
        title: "SoS Magics",
        name: "sos_magics"
    },
    {
        title: "Writing a new language module",
        name: "language_module"
    },
    {
        header: 2,
        title: "SoS Workflow"
    },
    
    {
        header: 3,
        title: "The basics"
    },
    {
        title: "SoS workflow: a 20 minute overview",
        name: "sos_overview"
    },
    {
        title: "Variables and parameters",
        name: "variable_and_parameter"
    },
    {
        title: "Step input, output, and substeps",
        name: "input_substeps"
    },
    {
        title: "Basic SoS workflows",
        name: "basic_workflow"
    },
    {
        title: "Using SoS Workflow for daily data analysis",
        name: "organize_scripts"
    },
    {
        header: 3,
        title: "Syntax and data types"
    },
    {
        title: "Syntax and file formats",
        name: "sos_syntax"
    },
    {
        title: "Script format of function calls",
        name: "script_format"
    },
    {
        title: "The parameter statement",
        name: "parameter_statement"
    },
    {
        title: "Configuration files",
        name: "config_files"
    },
    {
        title: "SoS targets",
        name: "targets"
    },
    {
        title: "The sos_targets data type",
        name: "sos_targets"
    },
    {
        title: "SoS functions",
        name: "sos_functions"
    },
    {
        title: "Extending SoS",
        name: "extending_sos"
    },
    {
        header: 3,
        title: "SoS Steps"
    },
    {
        title: "The input statement",
        name: "input_statement"
    },
    {
        title: "Named input",
        name: "named_input"
    },
    {
        title: "Input option group_by",
        name: "group_by"
    },
    {
        title: "Input option for_each",
        name: "for_each"
    },
    {
        title: "Input options paired_with and group_with",
        name: "paired_group_with"
    },
    {
        title: "Input option pattern and function expand_pattern",
        name: "input_pattern"
    },
    {
        title: "Input option concurrent",
        name: "concurrent_substep"
    },
    {
        title: "Dynamic input",
        name: "dynamic_input"
    },
    {
        title: "The output statement",
        name: "output_statement"
    },
    {
        title: "Output option group_by",
        name: "output_group_by"
    },
    {
        title: "Output option paired_with and group_with",
        name: "output_groups_vars"
    },
    {
        title: "Dynamic output",
        name: "dynamic_output"
    },
    {
        title: "The depends statement",
        name: "depends_statement"
    },
    {
        title: "SoS actions and common options",
        name: "sos_actions"
    },
    {
        title: "Command execution actions",
        name: "shell_actions"
    },
    {
        title: "Script execution actions",
        name: "script_actions"
    },
    {
        title: "Report generation actions",
        name: "report_actions"
    },
    {
        title: "Conditional actions",
        name: "control_actions"
    },
    {
        title: "Action download",
        name: "download_actions"
    },
    {
        title: "Running scripts in docker containers",
        name: "docker"
    },
    {
        title: "Running scripts in singularity",
        name: "singularity"
    },
    {
        title: "The task statement and option -q)",
        name: "task_statement"
    },
    {
        title: "Host configuration",
        name: "host_setup"
    },
    {
        title: "Task templates",
        name: "task_template"
    },
    {
        title: "Task tags",
        name: "task_tags"
    },
    {
        title: "Combining tasks",
        name: "trunk_size"
    },
    {
        title: "Path translation and file synchronization",
        name: "task_files"
    },
    {
        title: "Working with remote files",
        name: "remote_target"
    },
    {
        header: 3,
        title: "SoS Workflows"
    },
    {
        title: "Summary of step dependencies",
        name: "step_dependencies"
    },
    {
        title: "Named output",
        name: "named_output"
    },
    {
        title: "Output from another step",
        name: "output_from"
    },
    {
        title: "Explicit step and workflow dependency",
        name: "target_sos_step"
    },
    {
        title: "Makefile-style pattern-matching rules",
        name: "auxiliary_steps"
    },
    {
        title: "Global and local variables",
        name: "step_variables"
    },
    {
        title: "Sharing variables across steps",
        name: "shared_variables"
    },
    {
        title: "Introduction to SoS Workflows",
        name: "sos_workflows"
    },
    {
        title: "Process-oriented workflows",
        name: "process_oriented"
    },
    {
        title: "Outcome-oriented workflows",
        name: "outcome_oriented"
    },
    {
        title: "Mixed-style workflows",
        name: "mixed_style"
    },
    {
        title: "Data-flow style workflows",
        name: "data_flow"
    },
    {
        title: "Nested workflow",
        name: "nested_workflow"
    },
    {
        header: 3,
        title: "Command line interface"
    },
    {
        title: "List of all sos commands and options",
        name: "cli"
    },
    {
        title: "Verbosity and number of workers",
        name: "verbosity_and_jobs"
    },
    {
        title: "Runtime signature",
        name: "signature"
    },
    {
        title: "Error handling",
        name: "error_handling"
    },
    {
        title: "Dependency tracing",
        name: "trace_dependency"
    },
    {
        title: "Dryrun mode",
        name: "dryrun"
    },
    {
        title: "Customized environments and remote execution of workflows",
        name: "remote_execution"
    },
    {
        title: "Output DAG of workflows",
        name: "workflow_dag"
    },
    {
        title: "Report generation",
        name: "workflow_summary"
    },
    {
        title: "Task management",
        name: "task_management"
    },
    {
        title: "Setup and test remote hosts",
        name: "sos_remote"
    },
    {
        title: "Format conversion",
        name: "convert"
    }
]
