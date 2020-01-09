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
        name: "multi_kernel_notebook",
        fulltitle: " Using multiple kernels in one Jupyter noetbook multi_kernel_notebook "
    },
    {
        title: "Working with arbitrary subkernels",
        name: "expand_capture_render",
        fulltitle: " Working with arbitrary subkernels magics cd expand capture and render expand_capture_render "
    },
    {
        title: "Exchanging data among kernels",
        name: "exchange_variable",
        fulltitle: " Exchanging data among kernels magics get put use and with exchange_variable "
    },
    {
        title: "Using the console panel",
        name: "console_panel",
        fulltitle: " Using the console panel console panel and shortcut Ctrl-Shift-Enter console_panel "
    },
    {
        title: "Previewing variables and files",
        name: "magic_preview",
        fulltitle: " Previewing variables and files magic preview magic_preview "
    },
    {
        title: "Tracking session and revision history of notebooks",
        name: "sessioninfo_revision",
        fulltitle: " Tracking session and revision history of notebooks magic revisions and sessioninfo sessioninfo_revision "
    },
    {
        title: "Running cell in modified environments",
        name: "magic_env",
        fulltitle: " Running cell in modified environments magic env magic_env "
    },
    {
        title: "Converting RMarkdown files to SoS notebooks",
        name: "rmd_to_ipynb",
        fulltitle: " Converting RMarkdown files to SoS notebooks sos convert rmd ipynb rmd_to_ipynb "
    },
    {
        title: "Exporting reports in HTML format",
        name: "magic_convert",
        fulltitle: " Exporting reports in HTML format magic convert magic_convert "
    },
    {
        title: "More on magic <code>%use</code>",
        name: "magic_use",
        fulltitle: " More on magic code use code magic_use "
    },
    {
        title: "Workflow-execution magics",
        name: "workflow_magics",
        fulltitle: " Workflow-execution magics magics run sosrun runfile workflow_magics "
    },
    {
        header: 3,
        title: "Supported languages "
    },
    
    {
        title: "Working with Bash",
        name: "sos_bash",
        fulltitle: " Working with Bash module sos-bash sos_bash "
    },
    {
        title: "Working with JavaScript and TypeScript",
        name: "sos_javascript",
        fulltitle: " Working with JavaScript and TypeScript module sos-javascript sos_javascript "
    },
    {
        title: "Working with Julia",
        name: "sos_julia",
        fulltitle: " Working with Julia module sos-julia sos_julia "
    },
    {
        title: "Working with Matlab and Octave",
        name: "sos_matlab",
        fulltitle: " Working with Matlab and Octave module sos-matlab sos_matlab "
    },
    {
        title: "Working with Ruby",
        name: "sos_ruby",
        fulltitle: " Working with Ruby module sos-ruby sos_ruby "
    },
    {
        title: "Working with Python 2 and Python3",
        name: "sos_python",
        fulltitle: " Working with Python 2 and Python3 module sos-python sos_python "
    },
    {
        title: "Working with R",
        name: "sos_r",
        fulltitle: " Working with R module sos-r sos_r "
    },
    {
        title: "Working with SAS",
        name: "sos_sas",
        fulltitle: " Working with SAS module sos-sas sos_sas "
    },
    {
        title: "Working with Stata",
        name: "sos_stata",
        fulltitle: " Working with Stata module sos-stata sos_stata "
    },
    {
        title: "Uisng the markdown kernel",
        name: "markdown_kernel",
        fulltitle: " Uisng the markdown kernel module markdown-kernel markdown_kernel "
    },
    {
        header: 3,
        title: "Technical details"
    },
    
    {
        title: "SoS Magics",
        name: "sos_magics",
        fulltitle: " SoS Magics sos_magics "
    },
    {
        title: "Writing a new language module",
        name: "language_module",
        fulltitle: " Writing a new language module language_module "
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
        name: "sos_overview",
        fulltitle: " SoS workflow a 20 minute overview sos_overview "
    },
    {
        title: "Variables and parameters",
        name: "variable_and_parameter",
        fulltitle: " Variables and parameters variable_and_parameter "
    },
    {
        title: "Step input, output, and substeps",
        name: "input_substeps",
        fulltitle: " Step input output and substeps input_substeps "
    },
    {
        title: "Basic SoS workflows",
        name: "basic_workflow",
        fulltitle: " Basic SoS workflows basic_workflow "
    },
    {
        title: "Using SoS Workflow for daily data analysis",
        name: "organize_scripts",
        fulltitle: " Using SoS Workflow for daily data analysis organize_scripts "
    },
    {
        header: 3,
        title: "Syntax and data types"
    },
    {
        title: "Syntax and file formats",
        name: "sos_syntax",
        fulltitle: " Syntax and file formats sos_syntax "
    },
    {
        title: "Script format of function calls",
        name: "script_format",
        fulltitle: " Script format of function calls script_format "
    },
    {
        title: "The parameter statement",
        name: "parameter_statement",
        fulltitle: " The parameter statement parameter_statement "
    },
    {
        title: "Configuration files",
        name: "config_files",
        fulltitle: " Configuration files config_files "
    },
    {
        title: "SoS targets",
        name: "targets",
        fulltitle: " SoS targets file_target sos_variable R_Library and more targets "
    },
    {
        title: "The sos_targets data type",
        name: "sos_targets",
        fulltitle: " The sos_targets data type sos_targets "
    },
    {
        title: "SoS functions",
        name: "sos_functions",
        fulltitle: " SoS functions get_output and expand_pattern sos_functions "
    },
    {
        title: "Extending SoS",
        name: "extending_sos",
        fulltitle: " Extending SoS extending_sos "
    },
    {
        header: 3,
        title: "SoS Steps"
    },
    {
        title: "The input statement",
        name: "input_statement",
        fulltitle: " The input statement input_statement "
    },
    {
        title: "Named input",
        name: "named_input",
        fulltitle: " Named input named_input "
    },
    {
        title: "Input option group_by",
        name: "group_by",
        fulltitle: " Input option group_by group_by "
    },
    {
        title: "Input option for_each",
        name: "for_each",
        fulltitle: " Input option for_each for_each "
    },
    {
        title: "Input options paired_with and group_with",
        name: "paired_group_with",
        fulltitle: " Input options paired_with and group_with paired_group_with "
    },
    {
        title: "Input option pattern and function expand_pattern",
        name: "input_pattern",
        fulltitle: " Input option pattern and function expand_pattern input_pattern "
    },
    {
        title: "Input option concurrent",
        name: "concurrent_substep",
        fulltitle: " Input option concurrent concurrent_substep "
    },
    {
        title: "Dynamic input",
        name: "dynamic_input",
        fulltitle: " Dynamic input dynamic target dynamic_input "
    },
    {
        title: "The output statement",
        name: "output_statement",
        fulltitle: " The output statement output_statement "
    },
    {
        title: "Output option group_by",
        name: "output_group_by",
        fulltitle: " Output option group_by output_group_by "
    },
    {
        title: "Output option paired_with and group_with",
        name: "output_groups_vars",
        fulltitle: " Output option paired_with and group_with output_groups_vars "
    },
    {
        title: "Dynamic output",
        name: "dynamic_output",
        fulltitle: " Dynamic output dynamic target dynamic_output "
    },
    {
        title: "The depends statement",
        name: "depends_statement",
        fulltitle: " The depends statement depends_statement "
    },
    {
        title: "SoS actions and common options",
        name: "sos_actions",
        fulltitle: " SoS actions and common options sos_actions "
    },
    {
        title: "Command execution actions",
        name: "shell_actions",
        fulltitle: " Command execution actions actions run sh and bash shell_actions "
    },
    {
        title: "Script execution actions",
        name: "script_actions",
        fulltitle: " Script execution actions actions Python R JavaScript etc script_actions "
    },
    {
        title: "Report generation actions",
        name: "report_actions",
        fulltitle: " Report generation actions actions report pandoc and RMarkdown report_actions "
    },
    {
        title: "Conditional actions",
        name: "control_actions",
        fulltitle: " Conditional actions actions warn_if skip_if done_if and fail_if control_actions "
    },
    {
        title: "Action download",
        name: "download_actions",
        fulltitle: " Action download download_actions "
    },
    {
        title: "Running scripts in docker containers",
        name: "docker",
        fulltitle: " Running scripts in docker containers Action option container and action docker_build docker "
    },
    {
        title: "Running scripts in singularity",
        name: "singularity",
        fulltitle: " Running scripts in singularity Action options container and engine action singularity_build singularity "
    },
    {
        title: "The task statement and option -q)",
        name: "task_statement",
        fulltitle: " The task statement and option -q task_statement "
    },
    {
        title: "Host configuration",
        name: "host_setup",
        fulltitle: " Host configuration sos hosts yml and sos remote command host_setup "
    },
    {
        title: "Task templates",
        name: "task_template",
        fulltitle: " Task templates options such as mem cores walltime and nodes task_template "
    },
    {
        title: "Task tags",
        name: "task_tags",
        fulltitle: " Task tags option tags task_tags "
    },
    {
        title: "Combining tasks",
        name: "trunk_size",
        fulltitle: " Combining tasks options trunk_size and trunk_workers trunk_size "
    },
    {
        title: "Path translation and file synchronization",
        name: "task_files",
        fulltitle: " Path translation and file synchronization options workdir to_host and from_host task_files "
    },
    {
        title: "Working with remote files",
        name: "remote_target",
        fulltitle: " Working with remote files remote target remote_target "
    },
    {
        header: 3,
        title: "SoS Workflows"
    },
    {
        title: "Summary of step dependencies",
        name: "step_dependencies",
        fulltitle: " Summary of step dependencies step_dependencies "
    },
    {
        title: "Named output",
        name: "named_output",
        fulltitle: " Named output function named_output named_output "
    },
    {
        title: "Output from another step",
        name: "output_from",
        fulltitle: " Output from another step function output_from output_from "
    },
    {
        title: "Explicit step and workflow dependency",
        name: "target_sos_step",
        fulltitle: " Explicit step and workflow dependency target sos_step target_sos_step "
    },
    {
        title: "Makefile-style pattern-matching rules",
        name: "auxiliary_steps",
        fulltitle: " Makefile-style pattern-matching rules section option provides auxiliary_steps "
    },
    {
        title: "Global and local variables",
        name: "step_variables",
        fulltitle: " Global and local variables step_variables "
    },
    {
        title: "Sharing variables across steps",
        name: "shared_variables",
        fulltitle: " Sharing variables across steps step and task option shared and target sos_variable shared_variables "
    },
    {
        title: "Introduction to SoS Workflows",
        name: "sos_workflows",
        fulltitle: " Introduction to SoS Workflows sos_workflows "
    },
    {
        title: "Process-oriented workflows",
        name: "process_oriented",
        fulltitle: " Process-oriented workflows process_oriented "
    },
    {
        title: "Outcome-oriented workflows",
        name: "outcome_oriented",
        fulltitle: " Outcome-oriented workflows outcome_oriented "
    },
    {
        title: "Mixed-style workflows",
        name: "mixed_style",
        fulltitle: " Mixed-style workflows mixed_style "
    },
    {
        title: "Data-flow style workflows",
        name: "data_flow",
        fulltitle: " Data-flow style workflows data_flow "
    },
    {
        title: "Nested workflow",
        name: "nested_workflow",
        fulltitle: " Nested workflow function sos_run nested_workflow "
    },
    {
        header: 3,
        title: "Command line interface"
    },
    {
        title: "List of all sos commands and options",
        name: "cli",
        fulltitle: " List of all sos commands and options cli "
    },
    {
        title: "Verbosity and number of workers",
        name: "verbosity_and_jobs",
        fulltitle: " Verbosity and number of workers options -v and -j verbosity_and_jobs "
    },
    {
        title: "Runtime signature",
        name: "signature",
        fulltitle: " Runtime signature option -s signature "
    },
    {
        title: "Error handling",
        name: "error_handling",
        fulltitle: " Error handling option -e error_handling "
    },
    {
        title: "Dependency tracing",
        name: "trace_dependency",
        fulltitle: " Dependency tracing option -T trace_dependency "
    },
    {
        title: "Dryrun mode",
        name: "dryrun",
        fulltitle: " Dryrun mode option -n dryrun "
    },
    {
        title: "Customized environments and remote execution of workflows",
        name: "remote_execution",
        fulltitle: " Customized environments and remote execution of workflows option -r remote_execution "
    },
    {
        title: "Output DAG of workflows",
        name: "workflow_dag",
        fulltitle: " Output DAG of workflows option -d workflow_dag "
    },
    {
        title: "Report generation",
        name: "workflow_summary",
        fulltitle: " Report generation option -p workflow_summary "
    },
    {
        title: "Task management",
        name: "task_management",
        fulltitle: " Task management commands status kill and purge task_management "
    },
    {
        title: "Setup and test remote hosts",
        name: "sos_remote",
        fulltitle: " Setup and test remote hosts command sos remote sos_remote "
    },
    {
        title: "Format conversion",
        name: "convert",
        fulltitle: " Format conversion command sos convert and convert convert "
    }
]
